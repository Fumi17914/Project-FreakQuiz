//
//  ModeViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class ModeViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var easyMarioMode: UIButton!
    @IBOutlet weak var difficultKratosMode: UIButton!
    
    @IBAction func chooseMode (_ sender: UIButton) {
        Game.shared.mode = (sender.tag == 0) ? .easy : .hard
        performSegue(withIdentifier: segueIdentifier,
                     sender: sender)
    }
    
    // MARK: Segues
    private let segueIdentifier = "SEGUE_FROM_MODE_TO_PLAYERS"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJson()
        configureViews()
        configureFont()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)

    }

    // MARK: Configurar vistas (sombra, cornerRadius...)
    private func configureViews() {
        easyMarioMode.configure()
        difficultKratosMode.configure()
    }
    
    // MARK: Configurar tipo de letra en textos
    private func configureFont() {
        
        titleLabel.font = UIFont(name: "PixelEmulator", size: titleLabel.font.pointSize)
    }
    
    // MARK: Coger y guardar los datos del json
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func loadJson() {
        guard let jsonData = readLocalFile(forName: "sampleData") else {
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(GameData.self, from: jsonData)
            Game.shared.questions = data.questions
            Game.shared.tests = data.tests
            
        } catch {
            print(error.localizedDescription)
        }
    }
}


