//
//  SettingsModel.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 21.11.2024.
//

import SwiftUI

class SettingsModel: ObservableObject {
    @AppStorage("soundEnabled") var soundEnabled: Bool = true
    @AppStorage("musicEnabled") var musicEnabled: Bool = true
}
