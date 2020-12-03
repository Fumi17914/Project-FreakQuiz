//
//  ChoosePlayerViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class ChoosePlayerViewController: UIViewController {
    
    // MARK: IB Outlets, segueIdentifier, IB Action
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var batmanButton: UIButton!
    @IBOutlet weak var supermanButton: UIButton!
    @IBOutlet weak var spidermanButton: UIButton!
    @IBOutlet weak var indianaJonesButton: UIButton!
    @IBOutlet weak var doctorButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var deadpoolButton: UIButton!
    @IBOutlet weak var wolverineButton: UIButton!
    @IBOutlet weak var noelButton: UIButton!
    @IBOutlet weak var devilButton: UIButton!
    
    private let identifierPlayers = "SEGUE_FROM_PLAYERS_TO_READY"
    
    @IBAction func selectPlayer (_ sender: UIButton) {
        selectedCharacter(sender: sender, button: batmanButton, opacity: 0.25, player: Player.Characters.Batman.rawValue)
        selectedCharacter(sender: sender, button: supermanButton, opacity: 0.25, player: Player.Characters.Superman.rawValue)
        selectedCharacter(sender: sender, button: spidermanButton, opacity: 0.25, player: Player.Characters.Spiderman.rawValue)
        selectedCharacter(sender: sender, button: deadpoolButton, opacity: 0.25, player: Player.Characters.Deadpool.rawValue)
        selectedCharacter(sender: sender, button: devilButton, opacity: 0.25, player: Player.Characters.Devil.rawValue)
//        selectedCharacter(sender: sender, button: wolverineButton, opacity: 0.25, player: Player.Characters.Lobezno.rawValue)
        selectedCharacter(sender: sender, button: girlButton, opacity: 0.25, player: Player.Characters.Girl.rawValue)
        selectedCharacter(sender: sender, button: doctorButton, opacity: 0.25, player: Player.Characters.Doctor.rawValue)
        selectedCharacter(sender: sender, button: indianaJonesButton, opacity: 0.25, player: Player.Characters.Indy.rawValue)
        selectedCharacter(sender: sender, button: noelButton, opacity: 0.25, player: Player.Characters.Noel.rawValue)
            
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: VieDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureFont()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
    }
    
    
    // MARK: Configurar tipo de letra en textos
    private func configureFont() {
        
        titleLabel.font = UIFont(name: "PixelEmulator", size: titleLabel.font.pointSize)
    }
    
    // MARK: Enviar información a PlayerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as PlayerReadyViewController:
            destination.finalPlayer = Game.shared.player
        default:
            break
        }
    }
    
    // MARK: Función que añade jugador a la lista de jugadores en función del personaje seleccionado
    private func selectedCharacter(sender: UIButton, button:UIButton, opacity: CGFloat, player: Player.Characters.RawValue) {
        if sender.tag == button.tag {
            button.alpha = opacity
            Game.shared.player.append(player)
        }
    }
}

