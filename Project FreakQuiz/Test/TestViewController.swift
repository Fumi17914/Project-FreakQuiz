//
//  TestViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class TestViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var imageContinue: UIImageView!
    @IBOutlet weak var starButton: UIButton!
    
    // MARK: Variables
    var testPlayer: String = "User"
    private let identifierScore = "SEGUE_FROM_TEST_TO_SCORE"
    private let identifierReady = "SEGUE_FROM_TEST_TO_READY"
    private let proof = Game.shared.test.randomElement()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestionButton.configure()
        Game.shared.configureBackgroundColor(button: nextQuestionButton)

        configureFont()
        configureImage()
        
        playerLabel.text = testPlayer
        testLabel.text = Game.shared.test
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        starButton.frame = CGRect(x: 355, y: 44, width: 44, height: 42)

    }
    
    // MARK: Configura letra de los textos
    private func configureFont() {
        playerLabel.font = UIFont(name: "PixelEmulator", size: playerLabel.font.pointSize)
        testLabel.font = UIFont(name: "PixelEmulator", size: testLabel.font.pointSize)
        nextQuestionButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 20)
        
    }
    
    // MARK: Configurar imágenes según modo escogido
    private func configureImage() {
        switch Game.shared.mode {
        case .easy:
            imageContinue.image = UIImage(named: "luigisMansion")
            nextQuestionButton.setImage(UIImage(named: "nextQuestionEasy"), for: .normal)

        case .hard:
            imageContinue.image = UIImage(named: "zoidberg")
            nextQuestionButton.setImage(UIImage(named: "nextQuestionDifficult"), for: .normal)

        }
    }
    
}



