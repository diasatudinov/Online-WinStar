//
//  QuizView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 22.11.2024.
//

import SwiftUI

struct QuizView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var questions: [QuizQuestion] = []
    @State private var currentQuestionIndex = 0
    @State private var selectedOption: Int?
    @State private var score = 0
    @State private var showAnswerFeedback = false
    @State private var isCorrectAnswer = false
    @ObservedObject var achievementsVM: AchievementsViewModel
    let viewModel = QuizViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    let optionLetters = ["A", "B", "C", "D"]

    var body: some View {
        
        ZStack {
            
            VStack {
                if currentQuestionIndex < questions.count {
                    VStack {
                        Text("\(currentQuestionIndex + 1). \(questions[currentQuestionIndex].question)")
                            .font(.custom(Fonts.tiltWarp.rawValue, size: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .textCase(.uppercase)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white.opacity(0.3))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            )
                            .padding(.top, 50)
                        
                        
                        HStack(spacing: 0) {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(0..<4) { index in
                                    Button(action: {
                                        selectedOption = index
                                        checkAnswer()
                                    }) {
                                        ZStack {
                                            Image(.quizVariant)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 50)
                                            Text("\(optionLetters[index])")
                                                .font(.custom(Fonts.tiltWarp.rawValue, size: 18))
                                                .foregroundColor(.white)
                                                .multilineTextAlignment(.center)
                                            
                                            
                                        }.overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(
                                                    selectedOption == index && showAnswerFeedback
                                                    ? (isCorrectAnswer ? Color.green : Color.red)
                                                    : Color.clear,
                                                    lineWidth: selectedOption == index && showAnswerFeedback ? 4 : 2
                                                )
                                        )
                                    }
                                    .disabled(showAnswerFeedback)
                                }
                            }
                            .padding()
                        }.padding(.horizontal, 276)
                      
                    }
                } else {
                    Spacer()
                    Text("Quiz Completed!")
                        .font(.custom(Fonts.tiltWarp.rawValue, size: 34))
                        .foregroundStyle(.white)
                        .padding()
                    Text("Your Score: \(score)/\(questions.count)")
                        .font(.custom(Fonts.tiltWarp.rawValue, size: 28))
                        .foregroundStyle(.white)
                        .padding()
                    
                    Button("Return to Menu") {
                        if score > 14 {
                            achievementsVM.achievementTwoDone()
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                    .font(.title)
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Spacer()
                }
            }
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(.backBtn)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }

                   
                    Spacer()
                }
                .padding()
                Spacer()
            }
            
        }
            
           
        
        .navigationBarHidden(true)
        .onAppear(perform: loadQuestions)
        .background(
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
        )
     
    }
    
    func checkAnswer() {
        isCorrectAnswer = selectedOption == questions[currentQuestionIndex].correctAnswer
        if isCorrectAnswer {
            score += 1
        }
        showAnswerFeedback = true

        // Proceed to the next question after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            showAnswerFeedback = false
            selectedOption = nil
            currentQuestionIndex += 1
        }
    }
    
    func loadQuestions() {
        questions = viewModel.questions
        questions.shuffle()
    }

}

#Preview {
    QuizView(achievementsVM: AchievementsViewModel())
}

struct QuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: Int
}
