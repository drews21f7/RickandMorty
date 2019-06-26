//
//  CharacterController.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class CharacterController {
    
    static let sharedInstance = CharacterController()
    
    func fetchCharacterWith(searchTerm: String, completion: @escaping(RMcharacter?) -> Void) {
        
        let baseURL = URL(string: "https://rickandmortyapi.com/api/")
        
        let characterPathComponentURL = baseURL?.appendingPathComponent("character")
        
        guard let finalURL = characterPathComponentURL?.appendingPathComponent(searchTerm) else {return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print ("There was an error \(error.localizedDescription)")
            }
            
            if let data = data {
                
                do {
                    
                    let character = try  JSONDecoder().decode(RMcharacter.self, from: data)
                    completion(character)
                } catch {
                    print("Error Fetching character!")
                    completion(nil); return
                }
            }
        }.resume()
    }
    
//    func fetchCharacterImage(character: RMcharacter, completion: @escaping (UIImage?) -> Void) {
//
//        let imageURL = URL(string: "https://rickandmortyapi.com/api/character/avatar/")
//
//        let imagePathComponentURL = imageURL?.appendingPathComponent(RMcharacter.image)
//    }
}
