//
//  Game.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class Game {
    // MARK: - Properties
    static let shared = Game()
    
    // Initialization
    private init() {}
    
    var mode: Question.Mode = .easy
    var questions: Questions? = nil
    var tests: Tests? = nil
    
    // MARK: Preguntas según modo escogido
    var questionsEasy: [Question] {
        return questions?.filter{ $0.mode == .easy} ?? []
    }
    var questionsHard: [Question] {
        return questions?.filter{ $0.mode == .hard} ?? []
    }
   
    // MARK: Prueba a realizar al azar
    var test: String {
        return tests?.randomElement() ?? ""
    }

    // MARK: Lista de jugadores
    var player: [String] = []
    
    var scoreAndPlayers: [Player] = [Player(user: Player.Characters.Batman, score: 0),
                                     Player(user: Player.Characters.Superman, score: 0),
                                     Player(user: Player.Characters.Spiderman, score: 0),
                                  
                                     Player(user: Player.Characters.Girl, score: 0),
                                    
                                     Player(user: Player.Characters.Deadpool, score: 0),
                                     Player(user: Player.Characters.Doctor, score: 0),
                                     Player(user: Player.Characters.Devil, score: 0),
                                     Player(user: Player.Characters.Indy, score: 0),
                                     Player(user: Player.Characters.Noel, score: 0),
                                     Player(user: Player.Characters.Lobezno, score: 0)]
    
    // MARK: Función questions al azar según modo
    var randomQuestion: String? {
        if Game.shared.mode == .easy {
            return Game.shared.questionsEasy.randomElement()?.question
            
        } else if Game.shared.mode == .hard {
            return Game.shared.questionsHard.randomElement()?.question
        }
        
        return "No se han encontrado preguntas"
    }
    
    // MARK: Configurar color de las views según modo
    func configureBackgroundColor(button: UIButton) {
        switch Game.shared.mode {
        case .easy:
            button.backgroundColor = UIColor(named: "F7B500")
        case .hard:
            button.backgroundColor = UIColor(named: "EC3832")
        }
    }
}
