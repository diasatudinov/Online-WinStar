//
//  CatchGameView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 25.11.2024.
//

import SwiftUI

struct CatchGameView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var achievements: AchievementsViewModel
    
    @State var score = 0
    @State var starColor: StarColor = .yellow
    @State var timer = 30
    
    @State var achivement3 = false
    @State var gameOver = false
    var body: some View {
        ZStack {
            CatchGameSceneView(score: $score, color: $starColor, timer: $timer, achivement3: $achivement3, gameOver: $gameOver).ignoresSafeArea()
            
            VStack {
                ZStack {
                    
                    HStack {
                        
                        ZStack {
                            Image(.quizVariant)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 75)
                            VStack(spacing: -7) {
                                Text("TIMER")
                                    .font(.custom(Fonts.tiltWarp.rawValue, size: 15))
                                    .foregroundStyle(.white)
                                Text("00:\(timer)")
                                    .font(.custom(Fonts.tiltWarp.rawValue, size: 32))
                                    .foregroundStyle(.white)
                            }
                        }.frame(height: 75)
                        
                        ZStack {
                            Image(.quizVariant)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 75)
                            VStack(spacing: -7) {
                                Image(starColor == .yellow ? .yellowStar : .blueStar)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 25)
                                Text("\(score)")
                                    .font(.custom(Fonts.tiltWarp.rawValue, size: 32))
                                    .foregroundStyle(.white)
                            }
                        }.frame(height: 75)
                        
                        
                    }
                    
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
                    }
                }
                Spacer()
            }.padding()
            
            if gameOver {
                VStack {
                    Text("Game over!")
                        .font(.custom(Fonts.tiltWarp.rawValue, size: 32))
                        .foregroundStyle(.white)
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            Image(.menuBtn)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                            Text("Menu")
                                .font(.custom(Fonts.tiltWarp.rawValue, size: 32))
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }.background(
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
        )
        .onChange(of: achivement3) { newValue in
            if newValue {
                achievements.achievementThreeDone()
            }
            
        }
    }
}

#Preview {
    CatchGameView(achievements: AchievementsViewModel())
}
