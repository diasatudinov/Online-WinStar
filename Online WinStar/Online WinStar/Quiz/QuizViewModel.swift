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
            question: "What is the name of the galaxy where our Solar System is located?  \na) Andromeda Galaxy \nb) Large Magellanic Cloud \nc) Milky \nd) Orion Nebula",
            options: ["Ontario", "Quebec", "Alberta", "British Columbia"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "What is the closest star to Earth? \na) Sirius \nb) Alpha Centauri \nc) Betelgeuse \nd) The Sun",
            options: ["English", "French", "Spanish", "German"],
            correctAnswer: 3
        ),
        QuizQuestion(
            question: "What object in space has gravity so strong that even light cannot escape it? \na) Neutron star \nb) Black hole  \nc) Pulsar \nd) White dwarf",
            options: ["St. Lawrence River", "Fraser River", "Ottawa River", "Red River"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which planet in the Solar System has rings made of ice and dust? \na) Saturn \nb) Jupiter \nc) Uranus \nd) Neptune",
            options: ["Beaver", "Moose", "Polar Bear", "Canada Goose"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What was the name of the spacecraft that became the first to leave the Solar System? \na) Voyager 1 \nb) Pioneer 10 \nc) Cassini \nd) Apollo 11",
            options: ["1972", "1976", "1980", "1984"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "How many planets are there in the Solar System? \na) 7 \nb) 8 \nc) 9 \nd) 10",
            options: ["Toronto Maple Leafs", "Montreal Canadiens", "Vancouver Canucks", "Calgary Flames"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which planet is known as the \"Red Planet\"? \na) Venus \nb) Mars \nc) Jupiter \nd) Mercury",
            options: ["Mount Royal Cross", "Olympic Stadium Tower", "Place Ville Marie", "Notre-Dame Basilica"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the largest moon in the Solar System? \na) The Moon \nb) Titan \nc) Ganymede \nd) Europa",
            options: ["Poutine", "Butter Tart", "Nanaimo Bar", "BeaverTails"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "What does astronomy study? \na) Oceans \nb) Earthquakes \nc) Space \nd) Climate",
            options: ["Canadian Dollar", "US Dollar", "Euro", "British Pound"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "What was the first artificial satellite launched into space? \na) Luna 1 \nb) Sputnik 1 \nc) Soyuz 1 \nd) Apollo 1",
            options: ["Wasaga Beach", "Grand Beach", "Sugar Beach Toronto", "Parlee Beach"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the shape of our galaxy? \na) Circular \nb) Spiral \nc) Elliptical \nd) Irregular",
            options: ["Montreal", "Toronto", "Vancouver", "Calgary"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which planet is the hottest in the Solar System? \na) Mercury \nb) Venus \nc) Mars \nd) Jupiter",
            options: ["Atlantic Ocean", "Pacific Ocean", "Arctic Ocean", "Indian Ocean"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What is the name of the space telescope launched in 1990? \na) James Webb \nb) Hubble \nc) Chandra \nd) Spitzer",
            options: ["Hockey", "Lacrosse", "Baseball", "Football"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which planet is the largest in the Solar System? \na) Earth \nb) Saturn \nc) Jupiter \nd) Neptune",
            options: ["Appalachian Mountains", "Rocky Mountains", "Sierra Nevada", "Cascade Range"],
            correctAnswer: 2
        ),
        QuizQuestion(
            question: "What is the name of the largest volcano in the Solar System? \na) Etna \nb) Olympus Mons \nc) Mont Blanc \nd) Vesuvius",
            options: ["Mount Royal Park", "Stanley Park", "High Park", "Assiniboine Park"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "How long does it take light from the Sun to reach Earth? \na) 1 minute \nb) 8 minutes \nc) 30 minutes \nd) 1 hour",
            options: ["United States", "Mexico", "Greenland", "Russia"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "Which mission was the first to land humans on the Moon? \na) Apollo 11 \nb) Vostok 1 \nc) Gemini 3 \nd) Space Shuttle",
            options: ["Automobile Manufacturing", "Oil and Gas", "Textile Production", "Wine Making"],
            correctAnswer: 0
        ),
        QuizQuestion(
            question: "What is a comet made of? \na) Rock \nb) Ice \nc) Hot gas \nd) Liquid surface",
            options: ["Oak", "Maple", "Pine", "Birch"],
            correctAnswer: 1
        ),
        QuizQuestion(
            question: "What are meteoroids called when they reach Earth's surface? \na) Meteors \nb) Asteroids \nc) Meteorites \nd) Comets",
            options: ["Ontario", "Quebec", "British Columbia", "Nunavut"],
            correctAnswer: 2
        )
    ]
}
