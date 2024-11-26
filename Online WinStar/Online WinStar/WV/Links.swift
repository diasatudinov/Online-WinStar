//
//  Links.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 26.11.2024.
//

import SwiftUI

class Links {
    
    static let shared = Links()
    
    static let winStarData = "https://onlinews.xyz/info"
    // "?page=test"
    
    @AppStorage("finalUrl") var finalURL: URL?
    
    
}
