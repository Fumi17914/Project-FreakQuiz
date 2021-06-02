//
//  ScoreViewCell.swift
//  Project FreakQuiz
//
//  Created by Jose Fumanal Quintana on 2/12/20.
//

import UIKit

class ScoreViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var scorePlayerLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    
    override func prepareForReuse() {
        playerImage.image = UIImage(named: "")
        scorePlayerLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.configure()
        configureFont()
    }
    
    // MARK: Configurar cell
    func configureCell (player: String, score: String) {
        playerImage.image = UIImage(named: player)
        scorePlayerLabel.text = "\(score)"
    }
    
    // MARK: Configurar letra de textos
    private func configureFont() {
        //playerLabel.font = UIFont(name: "PixelEmulator", size: 15)
        scorePlayerLabel.font = UIFont(name: "PixelEmulator", size: 15)
    }
}

