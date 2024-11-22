//
//  LearnView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 22.11.2024.
//

import SwiftUI

struct LearnView: View {
    @Environment(\.presentationMode) var presentationMode
    let viewModel = LearnViewModel()
    @State var infoShow = false
    @State var selectedInfo = LearnModel(title: "", title2: "", body: "")
    var body: some View {
        ZStack {
            
            VStack(spacing: 8) {
                Spacer()
                HStack {
                    Button {
                        
                            selectedInfo = viewModel.info[0]
                        
                        infoShow = true
                    } label: {
                        learCell(bgImage: .learnBg1, text: viewModel.info[0].title)

                    }
                    
                    Button {
                            selectedInfo = viewModel.info[1]
                        
                        infoShow = true
                        
                    } label: {
                        learCell(bgImage: .learnBg2, text: viewModel.info[1].title)

                    }
                }
                
                HStack {
                    Button {
                        infoShow = true
                            selectedInfo = viewModel.info[2]
                    } label: {
                        learCell(bgImage: .learnBg3, text: viewModel.info[2].title)
                    }
                    
                    Button {
                        infoShow = true
                            selectedInfo = viewModel.info[3]
                    } label: {
                        learCell(bgImage: .learnBg4, text: viewModel.info[3].title)
                    }
                }.padding(.bottom, 32)
                
              
            }
            
            VStack {
                ZStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(.backBtn)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                        
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Learn About  Stars")
                            .font(.custom(Fonts.tiltWarp.rawValue, size: 32))
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                        Spacer()
                    }
                }
                
                Spacer()
            }
            
        }.textCase(.uppercase).background(
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
        )
        .fullScreenCover(isPresented: $infoShow) {
                InfoView(selectedInfo: $selectedInfo)
            
        }
        
    }
    
    @ViewBuilder func learCell(bgImage: ImageResource, text: String) -> some View {
        
        
        
        ZStack {
            
            Image(bgImage)
                .resizable()
                .foregroundColor(.black)
                .scaledToFit()
                .frame(height: 120)
            
            
            Text(text)
                .font(.custom(Fonts.tiltWarp.rawValue, size: 11))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
        
    }
}

#Preview {
    LearnView()
}


