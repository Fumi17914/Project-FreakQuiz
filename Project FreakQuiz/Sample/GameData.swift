//
//  GameData.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import Foundation

typealias Questions = [Question]
typealias Tests = [String]

struct GameData: Codable {
    let questions: Questions
    let tests: Tests
}

