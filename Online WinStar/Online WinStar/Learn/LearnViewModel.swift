//
//  LearnViewModel.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 22.11.2024.
//

import Foundation

class LearnViewModel {
    var info: [LearnModel] = [
        LearnModel(title: "What are\n the stars?", title2: "What are the stars?", body: "Stars are massive, luminous spheres of gas, primarily hydrogen and helium, held together by gravity. They generate energy through nuclear fusion, producing light and heat that radiate into space."),
        LearnModel(title: "The most\n famous\n constellations", title2: "The most famous constellations", body: "Some of the most famous constellations include Orion, known for its prominent \"belt,\" the Big Dipper, which is part of Ursa Major, and the Zodiac constellations like Leo and Scorpio. These patterns have been used for navigation, storytelling, and marking seasons for thousands of years."),
        LearnModel(title: "Types of\n stars", title2: "Types of stars", body: "Stars are categorized by their size, temperature, and brightness, including types like dwarf stars, giants, supergiants, and neutron stars. They also vary by spectral type, such as O, B, A, F, G, K, and M, ranging from hot, blue stars to cooler, red ones."),
        LearnModel(title: "The history of\n stargazing", title2: "The history of stargazing", body: "Stargazing dates back to ancient civilizations like the Babylonians, Egyptians, and Chinese, who tracked celestial movements for calendars and religious purposes. Over centuries, it evolved into modern astronomy, which uses advanced technology to explore the universe.")
    ]
}

struct LearnModel {
    var id = UUID()
    var title: String
    var title2: String
    var body: String
}
