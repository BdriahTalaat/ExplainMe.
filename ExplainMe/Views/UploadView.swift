//
//  UploadView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 27/03/1446 AH.
//

import SwiftUI
import UIKit
import MobileCoreServices
import PhotosUI


struct UploadView: View {
 
    //MARK: VARIABLES
    @State var isEditable = true
    @State var navigateToViewScreen = false // Navigation state
    @StateObject var sharedData = SharedData()
    @State var showImagePicker = false
    @StateObject var viewModel = PhotoPickerViewModel()
    @State var selectedPhotos: [UIImage] = []
    @State var openPDF = false
    @State var openAudio = false
    @State var showAlert = false
    @State var isSubmited = false
    @State var isYouTube = false
    @State var hasScrolled = false
    @State var uploadText = ""
    @State var aleartMessage = ""
    @FocusState var focusField:Field?
    var title:String = ""
    
    
    enum Field:Hashable{
        case upload
    }
    
    //MARK: BODY VIEW
    var body: some View {
        
        VStack {
            
            upload
                .offset(y:-250)
            
            // Navigation Link for conditional navigation
            NavigationLink(destination: ViewScreen(sharedData: sharedData), isActive: $navigateToViewScreen) {
                EmptyView()
            }
            
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(
            Image("Blob")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 700)
                .offset(x:200,y:-180)
        )
        .background(
            Color("Background")
        )
        .navigationTitle(title)
    }
        
    //MARK: VIEWS
    var upload: some View{
        
        VStack(alignment: .leading,spacing:30){
            
            pickerLunguage
            
            HStack {
                if title == "YouTube Link" {
                    
                    TextField("Upload", text: $sharedData.textField)
                        .inputStyle(icon: "square.and.arrow.up")
                        .focused($focusField, equals: .upload)
                        .shadow(color:focusField == .upload ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
                        .disabled(title != "YouTube Link")
                }
                else{
                    
                    TextField("Upload", text: $sharedData.textField)
                        .uploadStyle()
                        .focused($focusField, equals: .upload)
                        .shadow(color:focusField == .upload ? .primary.opacity(0.3) : .clear, radius: 10 , x:0 , y:3)
                        .disabled(title != "YouTube Link")
                }
                
                
                
                if title == "Upload Image"{
                    uploadImage
                }
                else if title == "Upload Sound"{
                    uploadSound
                }
                else if title == "Upload PDF"{
                    uploadPDF
                }
            }
            
            submittedButton
            
            
        }
        .padding()
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color:Color("Shadow").opacity(0.4),radius: 10,x:0,y: 10)
        .offset(y: 200)
        .padding(.horizontal,10)
        
        
    }
    var pickerLunguage: some View{
        HStack {
            Text("Select \(getSecondWord(from: title)) lunguage")
                .font(.headline)
            Spacer()
            
            Picker(selection: $sharedData.selectedLanguage, label: Text("Picker")) {
                Button{
                    changeLanguage(to: .arabic)
                }label: {
                    Text("Arabic")
                }.tag(LanguageModel.arabic)
                
                Button{
                    changeLanguage(to: .english)
                }label: {
                    Text("English")//.tag(LanguageModel.english)
                }.tag(LanguageModel.english)
            }
            
            
        }
    }
    
    var uploadSound: some View{
        Button{
            openAudio = true // Trigger the audio file importer
        }label:{
            Text("Import Sound")
                .font(.headline)
                .padding()
                .background(Color("Pink"))
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 20)
        }
        .fileImporter(isPresented: $openAudio, allowedContentTypes: [.audio]) { (result) in
            switch result {
            case .success(let url):
                if url.startAccessingSecurityScopedResource() {
                    defer { url.stopAccessingSecurityScopedResource() }
                    sharedData.textField  = "\(url.lastPathComponent)"
                    
                    // copy
                    
                    guard let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                    
                    let localURL = docDir.appendingPathComponent(url.lastPathComponent)
                    
                    do {
                        if FileManager.default.fileExists(atPath: localURL.path) {
                            // delete
                            try FileManager.default.removeItem(at: localURL)
                        }
                        try FileManager.default.copyItem(at: url, to: localURL)
                        print("file copied")
                    } catch let error as NSError {
                        print("ERROR Copying file", error)
                    }
                    sharedData.sound = localURL
                    
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }

        }
    }
    
    var uploadPDF: some View{
        Button{
            openPDF = true // Trigger the PDF file importer
        }label:{
            Text("Import PDF")
                .font(.headline)
                .padding()
                .background(Color("Pink"))
                .foregroundColor(.white)
                .cornerRadius(20)
                .shadow(radius: 20)
        }
        .fileImporter(isPresented: $openPDF, allowedContentTypes: [.pdf]) { (result) in
            switch result {
            case .success(let url):
                if url.startAccessingSecurityScopedResource() {
                    defer { url.stopAccessingSecurityScopedResource() }
                    sharedData.textField  = "\(url.lastPathComponent)"
                    
                    // copy
                    
                    guard let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
                    
                    let localURL = docDir.appendingPathComponent(url.lastPathComponent)
                    
                    do {
                        if FileManager.default.fileExists(atPath: localURL.path) {
                            // delete
                            try FileManager.default.removeItem(at: localURL)
                        }
                        try FileManager.default.copyItem(at: url, to: localURL)
                        print("file copied")
                    } catch let error as NSError {
                        print("ERROR Copying file", error)
                    }
                    sharedData.pdf = localURL
                    
                }
                
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }

    }
    
    var submittedButton: some View{
        
        Button{
            
            if !sharedData.textField.isEmpty {
                isSubmited = true
                
                
                switch title {
                    
                case "YouTube Link":
                    uploadYoutubeVideo()
                    sharedData.title = title
                case "Upload Sound":
                    //openAudio.toggle()
                    sharedData.title = title
                    navigateToViewScreen = true
                case "Upload PDF":
                    //openPDF.toggle()
                    sharedData.title = title
                    navigateToViewScreen = true
                case "Upload Image":
                    showImagePicker = true
                    sharedData.title = title
                    navigateToViewScreen = true
                default:
                    return
                }
                
                
                // Navigate if it's a YouTube video
                if isYouTube {
                    navigateToViewScreen = true
                }
                
                
                
            }else{
                aleartMessage = "Content must be entered."
                showAlert = true
            }
            
            
            
        }label: {
            
            Text("Submit")
                .frame(maxWidth: .infinity)

        }
        
        .font(.headline)
        .buttonStyle(.angular)
        .tint(.accentColor)
        .controlSize(.large)
        .shadow(color: Color("Shadow").opacity(0.2),radius: 30,x: 0,y: 30)
        .alert(isPresented: $showAlert) { // Alert modifier
            Alert(
                title: Text(showAlert ? "Error" : ""),
                message: Text(showAlert ? aleartMessage : aleartMessage),
                dismissButton: .default(Text("OK"))
            )
            
        }
        
    }
    
    
    var uploadImage: some View{
        VStack {
            
            PhotosPicker(
                selection: $viewModel.selectedItems,
                maxSelectionCount: 1, // Set the maximum number of selections
                matching: .images // Match images only
            ) {
                Text("Select Photos")
                    .font(.headline)
                    .padding()
                    .background(Color("Pink"))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
            }
            .onChange(of: viewModel.selectedItems) { newItems in
                Task {
                    // Reset the selected photos array
                    selectedPhotos.removeAll()
                    
                    // Load the selected images
                    for item in newItems {
                        // Retrieve the selected asset
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            selectedPhotos.append(image)
                            sharedData.textField = "\(image)"
                            sharedData.image = data
                        }
                    }
                }
            }
        }
    }
    
    //MARK: FUNCTIONS
    
    // Function to change the language
    func changeLanguage(to newLanguage: LanguageModel) {
        sharedData.selectedLanguage = newLanguage
    }
    
    func getSecondWord(from string: String) -> String {
        let words = string.split(separator: " ")
        return words.count > 1 ? String(words[1]) : ""
    }
    
    func uploadYoutubeVideo(){
        
        // Assuming getVideoID returns a String? and handles nil cases appropriately
        if let videoID = getVideoID(from: sharedData.textField) {
            sharedData.videoID = videoID
            //showAlert = true
            isYouTube = true
            
            
        }else{
            print("The URL is not a valid YouTube video.")
            showAlert = true
            aleartMessage = "The URL is not a valid YouTube video."
        }
    }
    
    
}

//MARK: CLASS
class PhotoPickerViewModel: ObservableObject {
    @Published var selectedItems: [PhotosPickerItem] = []
}


#Preview {
    UploadView()
}
