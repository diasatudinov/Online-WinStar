//
//  CatchGameSceneView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 25.11.2024.
//

import SwiftUI
import SpriteKit

struct CatchGameSceneView: UIViewRepresentable {
    @Binding var score: Int
    @Binding var color: StarColor
    @Binding var timer: Int
    
    @Binding var achivement3: Bool
    @Binding var gameOver: Bool
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = CatchGameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        scene.scoreUpdateHandler = { score in
            self.score = score
        }
        scene.starColorUpdateHandler = { color in
            DispatchQueue.main.async {
                self.color = color
            }
        }
        scene.timerUpdateHandler = { time in
            timer = time
        }
        scene.gameOver = { mistake in
            gameOver = true
            
            if mistake == false {
                achivement3 = true
            }
            
        }
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.backgroundColor = .clear
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        //
    }
    

}
