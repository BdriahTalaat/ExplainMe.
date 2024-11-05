//
//  QuizView.swift
//  ExplainMe
//
//  Created by Bdriah Talaat on 13/04/1446 AH.
//

import SwiftUI

struct QuizView: View {
    
    //MARK: VARIABLE
    @StateObject var sharedData = SharedData()
    @StateObject private var quizViewModel = QuizViewModel()
    @State var numberQuestions = 0
    @State var hasScrolled = true
    
    //MARK: BODY VIEW
    var body: some View {
        
        VStack {
            
            if quizViewModel.showScore {
                scoreView
                
            } else {
                questionView
            }
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(
            Image("Blob")
                .resizable()
                .scaledToFit()
                .frame(width: 700)
                .offset(x:200,y:-150)
            
        )
        .background(
            Color("Background")
        )
        .navigationTitle("Quiz")
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        
    }
    
    //MARK: VIEWS
    var scoreView: some View{
        Text("Your score: \(quizViewModel.score) / \(quizViewModel.questions.count)")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            .background(Color.blue.opacity(0.7))
            .cornerRadius(12)
            .shadow(radius: 10)
        //Spacer()
    }
 
    var questionView: some View {
        GeometryReader { geometry in
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    ForEach(quizViewModel.questions.indices, id: \.self) { index in
                        VStack {
                            Text(quizViewModel.questions[index].text)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                                .cornerRadius(12)
                                .shadow(radius: 10)
                            
                            let options = quizViewModel.questions[index].options
                            
                            ForEach(0..<((options.count + 1) / 2), id: \.self) { rowIndex in
                                HStack {
                                    ForEach(0..<2) { columnIndex in
                                        let optionIndex = rowIndex * 2 + columnIndex
                                        if optionIndex < options.count {
                                            Button(action: {
                                                quizViewModel.selectedAnswers[index] = options[optionIndex]
                                            }) {
                                                Text(options[optionIndex])
                                                    .padding()
                                                    .frame(width: geometry.size.width * 0.4)
                                                    .background(quizViewModel.selectedAnswers[index] == options[optionIndex] ? Color("Pink") : Color.gray.opacity(0.3))
                                                    .cornerRadius(12)
                                                    .foregroundColor(.black)
                                                    .font(.headline)
                                                    .shadow(radius: 5)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(.ultraThinMaterial)
                        .cornerRadius(20)
                        
                        
                    }
                    
                    buttons
                        
            
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.bottom,150)
                
            }
            .padding(.top)
            .scrollIndicators(.hidden)
            .overlay(
                NavigationBar(isHome: false, title: "", hasScrolled: $hasScrolled)
            )
            
        }
        
    }
    
    var buttons: some View{
        GeometryReader { geometry in
            HStack(alignment: .center) {
                Button{
                    
                }label:{
                    Text("Submit")
                        .padding()
                        .frame(width: geometry.size.width * 0.30)
                        .background(Color("Blue"))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                        .shadow(radius: 5)
                }
                .disabled(quizViewModel.selectedAnswers.contains(nil)) // Disable if any question is unanswered
                
                Button{
                    
                }label: {
                    Text("Download")
                        .padding()
                        .frame(width: geometry.size.width * 0.30)
                        .background(Color("Blue"))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                        .shadow(radius: 5)
                }
                
                Button{
                    
                }label: {
                    Text("Save")
                        .padding()
                        .frame(width: geometry.size.width * 0.30)
                        .background(Color("Blue"))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .font(.headline)
                        .shadow(radius: 5)
                }
                
            }
            .padding()
        }
    }
    
}

#Preview {
    QuizView()
}

//MARK: STRUCT
struct Question: Identifiable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctAnswer: String
}

class QuizViewModel: ObservableObject {
    
    var questions: [Question] = [
        Question(text: "What is the capital of France?", options: ["Paris", "London", "Berlin", "Madrid"], correctAnswer: "Paris"),
        Question(text: "What is 2 + 2?", options: ["3", "4", "5", "6"], correctAnswer: "4"),
        Question(text: "What is the largest planet?", options: ["Earth", "Mars", "Jupiter", "Saturn"], correctAnswer: "Jupiter")
    ]
    
    @Published var selectedAnswers: [String?]
    @Published var score: Int = 0
    @Published var showScore: Bool = false
       
    init() {
        selectedAnswers = Array(repeating: nil, count: questions.count) // Initialize with nil for each question
        
    }
       
    func submitAnswers() {
        score = selectedAnswers.enumerated().filter { index, answer in
            answer == questions[index].correctAnswer
        }.count
        
        showScore = true
        
    }
}
