//
//  AchievementsView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

struct AchievementsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AchievementsViewModel
    @State private var currentTab: Int = 0
    var body: some View {
        GeometryReader { geometry in
            let isLandscape = geometry.size.width > geometry.size.height
            ZStack {
                
                ZStack {
                    
                    if isLandscape {
                        ZStack {
                        // Горизонтальная ориентация
                            VStack(spacing: 0) {
                                Spacer()
                                TabView(selection: $currentTab) {
                                    achivementView(image: .achivement1, header: "Star Master", text: "Complete 3 levels of the main\n game without mistakes", isOpen: viewModel.achievementOne)
                                        .tag(0)
                                    achivementView(image: .achivement2, header: "Quiz Champion", text: "Answer 15+ quiz questions \ncorrectly", isOpen: viewModel.achievementTwo)
                                        .tag(1)
                                    achivementView(image: .achivement3, header: "Color Pro", text: "Catch 20 stars of the same color \nwithout mistakes", isOpen: viewModel.achievementThree)
                                        .tag(2)
                                }
                                .tabViewStyle(.page)
                                
                            }
                            
                            HStack {
                                Spacer()
                                Button {
                                    if currentTab > 0 {
                                        currentTab -= 1
                                    }
                                } label: {
                                    Image(.swipeBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .rotationEffect(.degrees(180))
                                }
                                Spacer()
                                Button {
                                    if currentTab < 2 { // Adjust based on the number of tabs
                                        currentTab += 1
                                    }
                                } label: {
                                    Image(.swipeBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                }
                                Spacer()
                            }
                        }
                    } else {
                        ZStack {
                        // Горизонтальная ориентация
                            VStack(spacing: 0) {
                                Spacer()
                                TabView(selection: $currentTab) {
                                    achivementView(image: .achivement1, header: "Star Master", text: "Complete 3 levels of the main\n game without mistakes", isOpen: viewModel.achievementOne)
                                        .tag(0)
                                    achivementView(image: .achivement2, header: "Quiz Champion", text: "Answer 15+ quiz questions \ncorrectly", isOpen: viewModel.achievementTwo)
                                        .tag(1)
                                    achivementView(image: .achivement3, header: "Color Pro", text: "Catch 20 stars of the same color \nwithout mistakes", isOpen: viewModel.achievementThree)
                                        .tag(2)
                                }
                                .tabViewStyle(.page)
                                
                            }
                            
                            HStack {
                                Spacer()
                                Button {
                                    if currentTab > 0 {
                                        currentTab -= 1
                                    }
                                } label: {
                                    Image(.swipeBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                        .rotationEffect(.degrees(180))
                                }
                                Spacer()
                                Button {
                                    if currentTab < 2 { // Adjust based on the number of tabs
                                        currentTab += 1
                                    }
                                } label: {
                                    Image(.swipeBtn)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 40)
                                }
                                Spacer()
                            }
                        }
                    }
                    
                }.textCase(.uppercase)
                
                VStack {
                    ZStack {
                        
                        HStack {
                            Spacer()
                            Text("Achievements")
                                .font(.custom("TiltWarp-Regular", size: 32))
                                .foregroundColor(.white)
                                .textCase(.uppercase)
                            
                            Spacer()
                        }
                        .padding()
                        
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
                        
                        
                    }
                    Spacer()
                }
                
            }.background(
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
            )
        }
    }
    
    @ViewBuilder func achivementView(image: ImageResource, header: String, text: String, isOpen: Bool) -> some View {
        
        
        
        VStack(alignment: .center, spacing: 0) {
            
            Image(image)
                .renderingMode(isOpen ? .original : .template)
                .resizable()
                .foregroundColor(.black)
                .scaledToFit()
                .frame(height: 130)
                .padding(.bottom, 30)
            
            Text(header)
                .font(.custom(Fonts.tiltWarp.rawValue, size: 20))
                .foregroundColor(.mainBlue)
                .shadow(color: .white, radius: 2)
                .padding(.bottom, 8)
            Text(text)
                .font(.custom(Fonts.tiltWarp.rawValue, size: 13))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
        
    }
}

#Preview {
    AchievementsView(viewModel: AchievementsViewModel())
}

