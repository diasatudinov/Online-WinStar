//
//  MenuView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showGame = false
    @State private var showCatch = false
    @State private var showLearnStars = false
    @State private var showAchievements = false
    @State private var showSettings = false
    @State private var showQuiz = false
    
    @StateObject var achievementsVM = AchievementsViewModel()
//    @StateObject var leaderboardVM = LeaderboardViewModel()
    @StateObject var settingsVM = SettingsModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                Spacer()

                if geometry.size.width < geometry.size.height {
                    // Вертикальная ориентация
                    ZStack {
                        
                        VStack {
                            HStack{
                                Spacer()
                                Button {
                                    showSettings = true
                                } label: {
                                    Image(.settingsBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                }
                            }
                            Spacer()
                        }.padding()
                        
                        HStack {
                            Spacer()
                            VStack(spacing: 25) {
                                MenuButton(text: "Star Quiz", fontSize: 20) {
                                    showQuiz = true
                                }
                                
                                MenuButton(text: "Catch & Match", fontSize: 20) {
                                    showCatch = true
                                }
                                
                                MenuButton(text: "Achievements", fontSize: 20) {
                                    showAchievements = true
                                }
                                
                                MenuButton(text: "Learn About \nStars", fontSize: 20) {
                                    showLearnStars = true
                                   
                                }
                                
                                MenuButton(text: "PLAY", fontSize: 20) {
                                    showGame = true

                                    
                                }
                            }
                            Spacer()
                        }
                    }
                } else {
                    ZStack {
                        
                        VStack {
                            HStack{
                                Spacer()
                                Button {
                                    showSettings = true
                                } label: {
                                    Image(.settingsBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 70)
                                }
                            }
                            Spacer()
                        }.padding()
                        
                        VStack {
                            Spacer()
                            VStack(spacing: 0) {
                                Spacer()
                                HStack(spacing: 40) {
                                    Spacer()
                                    MenuButton(text: "Star Quiz", fontSize: 20) {
                                        showQuiz = true
                                    }
                                    .frame(height: 100)
                                    
                                    MenuButton(text: "Catch & Match", fontSize: 20) {
                                        showCatch = true
                                    }
                                    .frame(height: 100)
                                    Spacer()
                                }
                                
                                HStack(spacing: 40) {
                                    Spacer()
                                    MenuButton(text: "Achievements", fontSize: 20) {
                                        showAchievements = true
                                    }
                                    .frame(height: 100)
                                    
                                    MenuButton(text: "Learn About \nStars", fontSize: 20) {
                                        showLearnStars = true
                                    }
                                    .frame(height: 100)
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    MenuButton(text: "PLAY", fontSize: 20) {
                                        showGame = true
                                    }
                                    .frame(height: 100)
                                    Spacer()
                                }
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
            .background(
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
            )
//            .onAppear {
//                if settingsVM.musicEnabled {
//                    MusicPlayer.shared.playMenuMusic()
//                }
//            }
//            .onChange(of: settingsVM.musicEnabled) { enabled in
//                if enabled {
//                    MusicPlayer.shared.playMenuMusic()
//                } else {
//                    MusicPlayer.shared.stopBackgroundMusic()
//                }
//            }
            .fullScreenCover(isPresented: $showGame) {
             //   GameView(achievementsVM: achievementsVM, leaderboardVM: leaderboardVM, settingsVM: settingsVM)
                GameView(achievements: achievementsVM)
            }
            .fullScreenCover(isPresented: $showQuiz) {
                QuizView(achievementsVM: achievementsVM)
            }
            .fullScreenCover(isPresented: $showAchievements) {
                AchievementsView(viewModel: achievementsVM)
            }
            .fullScreenCover(isPresented: $showSettings) {
                SettingsView(settings: settingsVM)
            }
            .fullScreenCover(isPresented: $showCatch) {
                ContentView()
                //RulesView()
            }
            .fullScreenCover(isPresented: $showLearnStars) {
                LearnView()
            }
        }
    }
}

#Preview {
    MenuView()
}
