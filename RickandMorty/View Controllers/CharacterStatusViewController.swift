//
//  CharacterStatusViewController.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class CharacterStatusViewController: UIViewController {
    
    var characterInfoLandingPad: RMcharacter?

    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterStatusLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterNameLabel.text = characterInfoLandingPad?.name
        characterStatusLabel.text = characterInfoLandingPad?.status
        characterImage.image = characterInfoLandingPad?.image
        switch characterStatusLabel.text {
        case "Alive":
            backgroundView.backgroundColor = .cyan
        case "Dead":
            backgroundView.backgroundColor = .red
        default:
            backgroundView.backgroundColor = .orange
            

        }

        // Do any additional setup after loading the view.
    }
    

}
