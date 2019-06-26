//
//  CharacterInfoViewController.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class CharacterInfoViewController: UIViewController {

    @IBOutlet weak var characterSearchBar: UISearchBar!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterSpeciesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        characterSearchBar.delegate = self
        //CharacterController.sharedInstance.fetchCharacterWith(searchTerm: "2") { (success) in
            
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func isAliveButtonTapped(_ sender: Any) {
    }
    
    func updatesView(with character: RMcharacter) {
        DispatchQueue.main.async {
            self.characterNameLabel.text = character.name
            self.characterSpeciesLabel.text = character.species
        }
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCharacterStatus" {
            let destinationVC = segue.destination as?
            CharacterStatusViewController
            
            let character = CharacterController.sharedInstance.characterSelect
            destinationVC?.characterInfoLandingPad = character
        }
    }


}
extension CharacterInfoViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        CharacterController.sharedInstance.fetchCharacterWith(searchTerm: searchText) { (character) in
            guard let character = character else { return }
            CharacterController.sharedInstance.fetchCharacterImage(character: character, completion: {
                (image) in
                DispatchQueue.main.async {
                    self.characterImage.image = image
                }
            })
            self.updatesView(with: character)
            
        }
    }
}
