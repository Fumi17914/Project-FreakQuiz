//
//  ErrorViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class ErrorViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var theAnswerWasLabel: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var imageNextQuestion: UIImageView!
    
    // MARK: Variables
    var correct: String = ""
    var errorPlayer: String = "User"
        
    private let identifierScore = "SEGUE_FROM_ERROR_TO_SCORE"
    private let identifierProve = "SEGUE_FROM_ERROR_TO_TEST"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonView.configure()
        Game.shared.configureBackgroundColor(button: buttonView)
        configureFont()
        configureImage()
        correctAnswer.text = correct
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }
    
    // MARK: Configurar letra de los textos
    private func configureFont() {
        titleLabel.font = UIFont(name: "PixelEmulator", size: titleLabel.font.pointSize)
        correctAnswer.font = UIFont(name: "PixelEmulator", size: correctAnswer.font.pointSize)
        theAnswerWasLabel.font = UIFont(name: "PixelEmulator", size: theAnswerWasLabel.font.pointSize)
        buttonView.titleLabel?.font = UIFont(name: "PixelEmulator", size: 20)
    }
    
    // MARK: Envía jugador a ProveViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as TestViewController:
            destination.testPlayer = errorPlayer
        default:
            break
        }
    }
    
    // MARK: Configurar imagen según modo de juego escogido
    private func configureImage() {
        switch Game.shared.mode {
        case .easy:
            imageNextQuestion.image = UIImage(named: "luigi")
        case .hard:
            imageNextQuestion.image = UIImage(named: "bart")
        }
    }
}

