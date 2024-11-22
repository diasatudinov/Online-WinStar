//
//  QuizViewModel.swift
//  Online WinStar
//
//  Created by Dias Atudinov on 22.11.2024.
//

import Foundation

class QuizViewModel {
    var questions: [QuizQuestion] = [
        QuizQuestion(
            question: "Who was the first human to travel into space?  \na) Neil Armstrong\nb) Yuri Gagarin\nc) Valentina Tereshkova\nd) Alexei Leonov ",
            options: ["Toronto", "Ottawa", "Montreal", "Vancouver"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which province is Montreal located in?",
            options: ["Ontario", "Quebec", "Alberta", "British Columbia"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the official language of Quebec?",
            options: ["English", "French", "Spanish", "German"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which river runs through Montreal?",
            options: ["St. Lawrence River", "Fraser River", "Ottawa River", "Red River"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is the national animal of Canada?",
            options: ["Beaver", "Moose", "Polar Bear", "Canada Goose"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "In which year did Montreal host the Summer Olympics?",
            options: ["1972", "1976", "1980", "1984"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which famous hockey team is based in Montreal?",
            options: ["Toronto Maple Leafs", "Montreal Canadiens", "Vancouver Canucks", "Calgary Flames"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the tallest structure in Montreal?",
            options: ["Mount Royal Cross", "Olympic Stadium Tower", "Place Ville Marie", "Notre-Dame Basilica"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which of these is a popular dish originating from Quebec?",
            options: ["Poutine", "Butter Tart", "Nanaimo Bar", "BeaverTails"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is the currency of Canada?",
            options: ["Canadian Dollar", "US Dollar", "Euro", "British Pound"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which landmark is known as 'Canada's Sugar Beach'?",
            options: ["Wasaga Beach", "Grand Beach", "Sugar Beach Toronto", "Parlee Beach"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "What is the largest city in Canada by population?",
            options: ["Montreal", "Toronto", "Vancouver", "Calgary"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which ocean is to the east of Canada?",
            options: ["Atlantic Ocean", "Pacific Ocean", "Arctic Ocean", "Indian Ocean"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is Canada's national sport?",
            options: ["Hockey", "Lacrosse", "Baseball", "Football"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which mountain range runs through western Canada?",
            options: ["Appalachian Mountains", "Rocky Mountains", "Sierra Nevada", "Cascade Range"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the name of the famous park in downtown Montreal?",
            options: ["Mount Royal Park", "Stanley Park", "High Park", "Assiniboine Park"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which country borders Canada to the south?",
            options: ["United States", "Mexico", "Greenland", "Russia"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which of these is a major industry in Canada?",
            options: ["Automobile Manufacturing", "Oil and Gas", "Textile Production", "Wine Making"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What leaf is depicted on the Canadian flag?",
            options: ["Oak", "Maple", "Pine", "Birch"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which is the largest province in Canada by area?",
            options: ["Ontario", "Quebec", "British Columbia", "Nunavut"],
            correctAnswer: 3
        ),
        QuizQuestion(
            question: "What is the population of Canada (approximate as of 2021)?",
            options: ["25 million", "38 million", "50 million", "70 million"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which famous waterfall is located on the Canada-US border?",
            options: ["Niagara Falls", "Victoria Falls", "Angel Falls", "Iguazu Falls"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is the name of Montreal's international airport?",
            options: ["Toronto Pearson", "Vancouver International", "Montreal-Pierre Elliott Trudeau", "Calgary International"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "Which Canadian city is known as the 'City of Festivals'?",
            options: ["Toronto", "Montreal", "Edmonton", "Ottawa"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which of these is a famous Canadian musician from Montreal?",
            options: ["Céline Dion", "Justin Bieber", "Shania Twain", "Drake"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which Canadian province is officially bilingual?",
            options: ["Ontario", "Quebec", "New Brunswick", "Manitoba"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "Which annual event is held in Montreal, attracting jazz enthusiasts worldwide?",
            options: ["Montreal Jazz Festival", "Toronto Jazz Fest", "Vancouver Jazz Fest", "Ottawa Jazz Festival"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is the oldest university in Montreal?",
            options: ["McGill University", "Concordia University", "Université de Montréal", "Université du Québec"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which river forms part of the border between Canada and the USA?",
            options: ["St. Lawrence River", "Mississippi River", "Columbia River", "Rio Grande"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Canada is part of which Commonwealth realm?",
            options: ["British Commonwealth", "French Commonwealth", "Spanish Commonwealth", "Dutch Commonwealth"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "Which of these is a popular winter sport in Canada?",
            options: ["Surfing", "Snowboarding", "Cricket", "Soccer"],
            correctAnswer: 1
        )
    ]
}
