//
//  ViewScreen.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 29/03/1446 AH.
//
import PhotosUI
import SwiftUI
import AVKit
import WebKit
import PhotosUI
import AVFoundation
import PDFKit

struct ViewScreen: View {
    
    //MARK: VARIBLES
    @State var selectedNumberQuestions = 0
    @Namespace var namespace
    @State var showNumberQuizAlert = false
    @State var showQuizView = false
    @State var elapsedTime: String = "00:00"
    @State var remainingTime: String = "00:00"
    @State var show = false
    @State var isPlayed = false
    @State var isPause = true
    @State var audioPlayer : AVAudioPlayer!
    @State var progress: Double = 0.0
    @State var smartDisplay = false
    @StateObject var sharedData = SharedData()
    @StateObject var viewModel = PhotoPickerViewModel()
    @State var selectedPhotos: [UIImage] = []
    //let videoURL:String = ""
   // var title:String = ""
    let column = [GridItem(.adaptive(minimum: 300),spacing: 20)]

    //MARK: BODY VIEW
    var body: some View {
        GeometryReader { proxy in
        
            let height = proxy.size.height
            
            VStack {
            
                ZStack {
                    switch sharedData.title{
                        
                    case "YouTube Link":
                        youTube
                            
                    case "Upload Sound":
                        sound(height: height)
                        
                    case "Upload PDF":
                        pdf
                        
                    case "Upload Image":
                        image
                        
                    default:
                        Text("")
                    }
                    
                }
                .padding(.vertical)
                
                ScrollView {
                    feature
                        .padding(.bottom,90)
                }
                .scrollIndicators(.hidden)
            }
            .padding(.top)
        }
        .navigationTitle(sharedData.title)
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(
            Group {
                if sharedData.title == "Upload Sound" {
                   /* Image("Sound Background")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity,alignment: .top)
                        .offset(y: -200)*/
                    Image("Blob")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 700)
                        .offset(x: 200, y: -180)

                } else {
                    Image("Blob")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 700)
                        .offset(x: 200, y: -180)
                }
            }
        )
        .background(
            Color("Background")
        )
    }
    
    //MARK: VIEWS
    
    var youTube: some View{
        VStack {
            
            YouTubePlayerView(videoID: sharedData.videoID)
                .cornerRadius(20)
                .shadow(color: .primary.opacity(0.3) , radius: 20 , x:0 , y:3)
                .padding(.horizontal,10)
        }
    }

    var pdf: some View{
        VStack {
            PDFKitView(url: sharedData.pdf)
                .cornerRadius(20)
                .padding(.horizontal,10)
        }
    }

    var image: some View{
        VStack {
            if let uiImage = UIImage(data: sharedData.image!) {
                
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(maxWidth: .infinity,maxHeight: .infinity)
                    .shadow(color: Color("Shadow").opacity(0.5) , radius: 20 , x:0 , y:3)
                    .padding()
                
            }
        }
    }
    
    var alertButtons: some View{
        VStack{
            //add buttons
            Button("5 Questions"){
                selectedNumberQuestions = 5
                showQuizView = true
            }
            
            Button("10 Questions"){
                selectedNumberQuestions = 10
                showQuizView = true
            }
            
            Button("20 Questions"){
                selectedNumberQuestions = 20
                showQuizView = true
            }
            
            Button("Cancel",role: .cancel){}
        }
    }
    
    var feature: some View {
        LazyVGrid(columns: column, spacing: 20) {
            ForEach(featureCourse) { item in
                
                switch item.name{
                case "Smart Asistant":
                    Button {
                        smartDisplay = true
                    } label: {
                        FeatureCourseItem(feature: item,nameSpace: namespace , show: $show)
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 20, x: 0, y: 3)
                    }
                    .sheet(isPresented: $smartDisplay) {
                        SmartAsistantView()
                            .presentationDetents([.height(600)]) // Set presentation sizes
                    }
                case "Quiz":
                    Button{
                        showNumberQuizAlert = true
                    }label: {
                        FeatureCourseItem(feature: item,nameSpace: namespace , show: $show)
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 20, x: 0, y: 3)
                    }
                    .alert("NumberQuestions", isPresented: $showNumberQuizAlert) {
                        alertButtons
                    }message:{
                        Text("How many Quetions Do you want? ")
                    }
                    
                    NavigationLink(
                        destination: QuizView(sharedData: sharedData,numberQuestions: selectedNumberQuestions),
                        isActive: $showQuizView
                    ){
                        EmptyView()
                     }

                case "Summary":
                    NavigationLink(destination: SummaryView()){
                        FeatureCourseItem(feature: item,nameSpace: namespace , show: $show)
                            .shadow(color: Color("Shadow").opacity(0.3), radius: 20, x: 0, y: 3)
                    }
                    
                default:
                    EmptyView()
                }
                
            }
        }
        .padding(.horizontal, 20)
    }
    
    //MARK: FUNCTIONS
    func playSound(url: URL) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            remainingTime = formatTime(seconds: audioPlayer.duration) // Initialize remaining time
            
        } catch let error as NSError {
            print("Error playing sound: \(error) \(error.userInfo)")
        }

        
    }
    
    func sound(height: CGFloat) -> some View{
        
        VStack {
            Button{
                self.isPlayed.toggle()
                self.isPause.toggle()
                
                if isPlayed {
                    
                    if let soundURL = sharedData.sound { // Assuming soundURL is a URL type
                        playSound(url: soundURL)
                        
                    }
                } else {
                    audioPlayer?.pause() // Pause if isPlayed is false
                    
                }
            }label:{
                // Toggle between shapes based on isPlayed state
                Group {
                    if isPlayed {
                        Circle()
                            .frame(width: height * 0.3, height: height * 0.3)
                            .foregroundColor(.clear)
                        
                    } else {
                        Circle()
                            .frame(width: height * 0.3, height: height * 0.3)
                            .foregroundColor(.clear)
                        
                    }
                }
                .overlay(
                    PlayView(isPlay: isPause, height: height)
                        .overlay(CircularView(value: progress))
                        .overlay(
                            Text("\(elapsedTime)")
                                .font(.callout.weight(.semibold))
                                .padding(.vertical,2)
                                .padding(.horizontal,4)
                                .background(Color(UIColor.systemBackground).opacity(0.3))
                                .cornerRadius(4)
                                .offset(y:height * 0.08)
                                
                        )
                )
            }
        }
        .onAppear {
            startProgressTimer()
        }
                            
        
    }
     
    // Timer to update progress
    func startProgressTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            
            // Update progress only if audio player is initialized
            guard let player = audioPlayer else { return }
            
            // Update progress regardless of pause/play state
            progress = player.currentTime / player.duration
            elapsedTime = formatTime(seconds: player.currentTime)
            
            // Stop the timer when audio finishes playing
            if player.currentTime == player.duration {
                timer.invalidate()
            }
        }
    }
    
    // Helper function to format time as MM:SS
    func formatTime(seconds: TimeInterval) -> String {
        let minutes = Int(seconds) / 60
        let seconds = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    ViewScreen()
}

//MARK: STRUCT
struct PDFKitView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true // Automatically scales the PDF to fit the view
        if let url = url, let document = PDFDocument(url: url) {
            pdfView.document = document
        }
        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
        // No need to update anything dynamically
    }
}
