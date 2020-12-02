//
//  Question.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import Foundation

struct Question: Codable {
    let id: Int
    let mode: Mode
    let question: String
    let options: [String]?
    let answer: Int?
    
    enum Mode: Int, Codable {
        case easy
        case hard
    }
}
