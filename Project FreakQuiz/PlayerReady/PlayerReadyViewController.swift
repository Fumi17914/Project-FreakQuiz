//
//  PlayerReadyViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class PlayerReadyViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var readyToPlayLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    
    // MARK: Variables
    var finalPlayer: [String]? = nil

    let random = Game.shared.player.randomElement() ?? ""
    
    private let identifierToQuestion = "SEGUE_FROM_READY_TO_QUESTION"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        configureFont()
        
        playerLabel.text = random
        playerImageView.image = UIImage(named: random)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    // MARK: Prepare For Segue. Envía jugador a QuestionViewController
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           switch segue.destination {
           case let destination as QuestionViewController:
               destination.finalPlayerQuestion = random
           default:
               break
           }
       }
    
    // MARK: Configurar letra de textos
    private func configureFont() {
        playerLabel.font = UIFont(name: "PixelEmulator", size: playerLabel.font.pointSize)
        readyToPlayLabel.font = UIFont (name: "PixelEmulator", size: playerLabel.font.pointSize)
        readyToPlayLabel.textColor = .white
        
    }
}

