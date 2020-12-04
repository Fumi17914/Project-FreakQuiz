//
//  ScoreViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class ScoreViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    private let identifierReady = "SEGUE_FROM_SCORE_TO_READY"
    
    var finalPlayersAndScore = Game.shared.scoreAndPlayers.sorted(by: {$0.score > $1.score})
    var newList: [Player] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestionButton.configure()
        Game.shared.configureBackgroundColor(button: nextQuestionButton)
        configureFont()
        configureTable()
        updatePlayers()
        configureImage()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)

    }
    
    
    // MARK: Configurar letra de los textos
    private func configureFont() {
        titleLabel.font = UIFont(name: "PixelEmulator", size: titleLabel.font.pointSize)
        nextQuestionButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 20)
    }
    
    private func configureTable() {
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    // MARK: Compara lista de todos los jugadores disponibles (12) con los seleccionados por parte del usuario. Genera una nueva lista de clase Players con user y score seleccionados por el usuario.
    private func updatePlayers() {
        for player in finalPlayersAndScore {
            for element in Game.shared.player {
                if player.user.rawValue == element {
                    newList.append(player)
                }
            }
        }
    }
    
    private func configureImage() {
        switch Game.shared.mode {
        case .easy:
            nextQuestionButton.setImage(UIImage(named: "continueEasy"), for: .normal)

        case .hard:
            nextQuestionButton.setImage(UIImage(named: "continueDifficult"), for: .normal)

        }
    }
}

extension ScoreViewController: UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.player.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreViewCell",
                                                       for: indexPath) as? ScoreViewCell else {
                    return UITableViewCell()
                                                        
        }
        
        // MARK: Configurar cell
        if indexPath.row <= Game.shared.player.count {
            let scoresForPlayers = newList[indexPath.row]
            cell.configureCell(player: scoresForPlayers.user.rawValue,
                               score: "\(scoresForPlayers.score)")
        }
        return cell
    }
}



