//
//  MenuButton.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

struct MenuButton: View {
    var text: String
    var fontSize: CGFloat
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            ZStack {
                Image("menuBtn")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 70)
                    
                Text(text)
                    .font(.custom("TiltWarp-Regular", size: fontSize))
                    .foregroundColor(.white)
                    .overlay(
                        Text(text)
                            .font(.custom("TiltWarp-Regular", size: fontSize))
                            .foregroundColor(.white)
                            .offset(x: 0, y: 0)
                            .drawingGroup() // Ensures smooth rendering
                            .shadow(color: .black, radius: 1, x: 0, y: 0)
                    )
                    .textCase(.uppercase)
            }
            .padding(-5)
        })
      
        //.background(Color.green)
        
    }
}



#Preview {
    MenuButton(text: "Star Quiz", fontSize: 20) {
        print("Test")
    }
        .frame(height: 88)
       
}
