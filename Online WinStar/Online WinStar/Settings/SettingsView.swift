//
//  SettingsView.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings: SettingsModel
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                HStack(spacing: 7) {
                    Button {
                        settings.soundEnabled.toggle()
                    } label: {
                        ZStack {
                            Image(.btnBg)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                            Image(settings.soundEnabled ? .soundOn : .soundOff)
                                .resizable()
                                .scaledToFit()
                                .frame(height: settings.soundEnabled ? 50 : 65)
                        }
                        
                    }
                    
                    Button {
                        settings.musicEnabled.toggle()
                    } label: {
                        ZStack {
                            Image(.btnBg)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 100)
                            Image(settings.musicEnabled ? .musicOn : .musicOff)
                                .resizable()
                                .scaledToFit()
                                .frame(height: settings.musicEnabled ? 50 : 65)
                        }
                        
                    }
                }.padding(.horizontal, 25)
              
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
                        Text("Settings")
                            .font(.custom("TiltWarp-Regular", size: 32))
                            .foregroundColor(.white)
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
    }
}

#Preview {
    SettingsView(settings: SettingsModel())
}
