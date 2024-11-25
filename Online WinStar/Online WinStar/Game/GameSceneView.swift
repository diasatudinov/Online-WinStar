//
//  GameSceneView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 25.11.2024.
//

import SwiftUI
import SpriteKit

struct GameSceneView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView()
        let scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .resizeFill
        skView.presentScene(scene)
        skView.ignoresSiblingOrder = true
        skView.backgroundColor = .clear
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        //
    }
    

}
