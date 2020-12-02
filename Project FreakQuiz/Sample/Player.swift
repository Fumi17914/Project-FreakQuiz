//
//  Player.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import Foundation

class Player {
    var user: Characters
    var score: Int = 0
    
    init(user: Characters, score: Int) {
        self.user = user
        self.score = score
    }
    
    func updateScore(_ score: Int) {
        self.score += score
    }
    
    enum Characters: String {
        case Batman = "Batman"
        case Superman = "Superman"
        case Lobezno = "Lobezno"
        case Doctor = "Meredith Grey"
        case Girl = "Aventurera"
        case Noel = "Papá Noel"
        case Indy = "Indiana Jones"
        case Spiderman = "Spider-Man"
        case Devil = "Diablo"
        case Deadpool = "Deadpool"
    }
}

