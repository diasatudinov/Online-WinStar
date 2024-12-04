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
    @State private var timeRemaining = 10 // Time in seconds
    @State private var timerIsRunning = false
    @State private var timer: Timer? = nil
    
    var body: some View {
        
        ZStack {
            
            VStack {
                if currentQuestionIndex < questions.count {
                    VStack {
                        Text("\(currentQuestionIndex + 1). \(questions[currentQuestionIndex].question)")
                            .font(.custom(Fonts.tiltWarp.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 30:18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .textCase(.uppercase)
                            .minimumScaleFactor(0.5)
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
                            .onChange(of: currentQuestionIndex ){ _ in
                                startTimer()
                            }
                        
                        
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
                                                .frame(height: DeviceInfo.shared.deviceType == .pad ? 95 : 50)
                                            Text("\(optionLetters[index])")
                                                .font(.custom(Fonts.tiltWarp.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 35:18))
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
                            }.padding()
                            
                        }//.padding(.horizontal, 276)
                        .frame(width: DeviceInfo.shared.deviceType == .pad ? 350:200)
                      
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
                            .frame(height: DeviceInfo.shared.deviceType == .pad ? 75 : 50)
                    }
                    Spacer()
                    if currentQuestionIndex < questions.count {
                        ZStack {
                            Image(.quizVariant)
                                .resizable()
                                .scaledToFit()
                                .frame(height: DeviceInfo.shared.deviceType == .pad ? 75 : 50)
                            Text("\(timeRemaining)")
                                .font(.custom(Fonts.tiltWarp.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 40 : 18))
                                .foregroundColor(.white)
                            
                        }
                    }
                    Spacer()
                    
                    Image(.backBtn)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .opacity(0)
                }
                .padding()
                Spacer()
            }
            
        }
            
           
        
        .navigationBarHidden(true)
        .onAppear{
            loadQuestions()
            startTimer()
        }
        
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
            stopTimer()
            
        }
    }
    
    func loadQuestions() {
        questions = viewModel.questions
        questions.shuffle()
    }
    
    func startTimer() {
        // Prevent multiple timers from running
        if timerIsRunning {
            return
        }
        
        timerIsRunning = true
        timeRemaining = 10
        // Create and schedule the timer
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer.invalidate() // Stop the timer when it reaches 0
                timerIsRunning = false
                checkAnswer()
            }
        }
    }
    
    // Function to stop the timer
    func stopTimer() {
           timerIsRunning = false
           timer?.invalidate() // Invalidate the existing timer
           timer = nil // Reset the timer reference
           timeRemaining = 10 // Reset the time
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
