//
//  CharacterController.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

class CharacterController {
    
    static let sharedInstance = CharacterController()
    
    func fetchCharacterWith(searchTerm: String, completion: @escaping(RMcharacter?) -> Void) {
        
        let baseURL = URL(string: "https://rickandmortyapi.com/api/")
        
        let characterPathComponentURL = baseURL?.appendingPathComponent("character")
        
        guard let finalURL = characterPathComponentURL?.appendingPathComponent(searchTerm) else {return}
        print(finalURL)
    }
}
