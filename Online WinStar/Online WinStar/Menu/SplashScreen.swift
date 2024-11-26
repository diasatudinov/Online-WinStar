//
//  SplashScreen.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Image(.splash)
                        .resizable()
                        .scaledToFit()
                        .frame(height: UIScreen.main.bounds.height / 3.5)
                        .scaleEffect(scale)
                        .animation(
                            Animation.easeInOut(duration: 0.8)
                                .repeatForever(autoreverses: true),
                            value: scale
                        )
                        .onAppear {
                            scale = 0.8
                        }
                    Spacer()
                    
                }
                Spacer()
                
                
            }
            
            VStack {
                Spacer()
                Text("LOADING...")
                    .font(.custom("TiltWarp-Regular", size: 25))
                    .foregroundColor(.white)
                    .padding(.bottom, 50)
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
    SplashScreen()
}
