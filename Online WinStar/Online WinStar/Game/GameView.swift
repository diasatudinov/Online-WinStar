//
//  GameView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 25.11.2024.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                GameSceneView().ignoresSafeArea()
                
            }
                
                .background(
                Image(.background)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            )
            
        }
    }
}

#Preview {
    GameView()
}
