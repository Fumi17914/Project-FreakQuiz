//
//  QuestionViewController.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
  
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    
    @IBOutlet weak var countDown: UILabel!
    
    // MARK: IB Action que te lleva a CorrectViewController si aciertas y, si fallas o se acaba el tiempo, a ErrorViewController
    @IBAction func buttonTapped (_ sender: UIButton) {
        if sender.tag == correctAnswerPlayer {
            navigate(to: identifierCorrect)
          
            // MARK: Sumar +1 por acertar pregunta
            Game.shared.scoreAndPlayers.forEach { player in
                if player.user.rawValue == finalPlayerQuestion {
                    player.updateScore(1)
                }
            }
            print("COMPROBAR QUE FUNCIOAN updateScore: \(Game.shared.scoreAndPlayers)")
        } else {
            navigate(to: identifierError, data: correctAnswerPlayer)
        }
    }
    
    // MARK: Variables
    private let identifierCorrect = "SEGUE_FROM_QUESTION_TO_CORRECT"
    private let identifierError = "SEGUE_FROM_QUESTION_TO_ERROR"
    private var timer: Timer?
    private var count = 15
    
    private var optionsPlayer: [String] = []
    private var questionPlayerList: [String] = []
    private var correctAnswerPlayer: Int?
    var finalPlayerQuestion: String?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureFont()
        generateOptionsToQuestion()
        
        
        if Game.shared.mode == .hard {
            answerOneButton.backgroundColor = .red
            answerTwoButton.backgroundColor = .red
            answerThreeButton.backgroundColor = .red
            answerFourButton.backgroundColor = .red
            
        }
        
        /*Game.shared.configureBackgroundColor(button: answerOneButton)
        Game.shared.configureBackgroundColor(button: answerTwoButton)
        Game.shared.configureBackgroundColor(button: answerThreeButton)
        Game.shared.configureBackgroundColor(button: answerFourButton)*/
        
        playerLabel.text = finalPlayerQuestion
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            self?.update()
        }
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
    }
    
    // MARK: Configurar vistas
    private func configureViews() {
        answerOneButton.configure()
        answerTwoButton.configure()
        answerThreeButton.configure()
        answerFourButton.configure()
        countDown.text = "\(count)"
    }
    
    // MARK: Generar preguntas y respuestas
    private func generateOptionsToQuestion() {
        let finalQuestion = Game.shared.randomQuestion
                
        for item in Game.shared.questionsEasy  {
            if finalQuestion == item.question {
                optionsPlayer = item.options ?? [""]
                correctAnswerPlayer = item.answer
            }
        }
        
        for item in Game.shared.questionsHard {
            if finalQuestion == item.question {
                optionsPlayer = item.options ?? [""]
                correctAnswerPlayer = item.answer
            }
        }
        
        answerOneButton.setTitle(optionsPlayer[0], for: .normal)
        answerTwoButton.setTitle(optionsPlayer[1], for: .normal)
        answerThreeButton.setTitle(optionsPlayer[2], for: .normal)
        answerFourButton.setTitle(optionsPlayer[3], for: .normal)
        
        questionLabel.text = finalQuestion
    }
    
    // MARK: Función para navegar a la siguiente pantalla
    func navigate(to identifier: String, data: Any? = nil) {
        performSegue(withIdentifier: identifier,
                     sender: data)
    }
    
    // MARK: Pasar datos a ErrorViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as ErrorViewController:
            destination.correct = optionsPlayer[correctAnswerPlayer ?? 0]
            destination.errorPlayer = finalPlayerQuestion ?? ""
        default:
            break
        }
    }
    
    // MARK: Actualizar cronómetro
    private func update() {
        count -= 1
        countDown.text = "\(count)"
        
        if count == 0 {
            timer?.invalidate()
            navigate(to: identifierError, data: correctAnswerPlayer)
        }
    }
        
    // MARK: Configurar letra de los textos
    private func configureFont() {
        playerLabel.font = UIFont(name: "PixelEmulator", size: playerLabel.font.pointSize)
        questionLabel.font = UIFont(name: "PixelEmulator", size: questionLabel.font.pointSize)
        answerOneButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 15)
        answerTwoButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 15)
        answerThreeButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 15)
        answerFourButton.titleLabel?.font = UIFont(name: "PixelEmulator", size: 15)
        countDown.font = UIFont(name: "PixelEmulator", size: countDown.font.pointSize)
    }
}



