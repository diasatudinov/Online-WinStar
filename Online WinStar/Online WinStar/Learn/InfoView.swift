//
//  InfoView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 22.11.2024.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedInfo: LearnModel
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.white.opacity(0.3))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 3).foregroundColor(.white)
                    )
                    
                VStack(alignment: .leading) {
                    Text(selectedInfo.title2)
                    
                    Text(selectedInfo.body)
                }.font(.custom(Fonts.tiltWarp.rawValue, size: 22))
                    .foregroundColor(.white)
                    .textCase(.uppercase)
                    .padding()
            }.padding(.horizontal, 100).padding(.vertical, 50).padding(.top, 32)
            
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
        }.background(
            Image(.background)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
        )
    }
}


#Preview {
    InfoView(selectedInfo: .constant(LearnModel(title: "What are\n the stars?", title2: "What are the stars?", body: "Stars are massive, luminous spheres of gas, primarily hydrogen and helium, held together by gravity. They generate energy through nuclear fusion, producing light and heat that radiate into space.")))
}
