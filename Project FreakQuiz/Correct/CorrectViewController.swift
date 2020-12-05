//
//  CorrectViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class CorrectViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var centralImage: UIImageView!
    
    private let identifierScore = "SEGUE_FROM_CORRECT_TO_SCORE"
    private let identifierReady = "SEGUE_FROM_CORRECT_TO_READY"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestionButton.configure()
//        Game.shared.configureBackgroundColor(button: nextQuestionButton)
        configureImage()
       

        configureFont()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        

    }
    
    // MARK: Configurar letra de los textos
    private func configureFont() {
        titleLabel.font = UIFont(name: "PixelEmulator", size: titleLabel.font.pointSize)
        nextQuestionButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 20)
    }
    
    // MARK: Configurar imagen para cada modo
    private func configureImage() {
        switch Game.shared.mode {
        case .easy:
            centralImage.image = UIImage(named: "marioWin")
            nextQuestionButton.setImage(UIImage(named: "nextQuestionEasy"), for: .normal)

        case .hard:
            centralImage.image = UIImage(named: "benderApplause")
            nextQuestionButton.setImage(UIImage(named: "nextQuestionDifficult"), for: .normal)

        }
    }
}

