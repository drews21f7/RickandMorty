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
    
    var characterSelect: RMcharacter?
    
    
    func fetchCharacterWith(searchTerm: String, completion: @escaping(RMcharacter?) -> Void) {
        
        guard let baseURL = URL(string: "https://rickandmortyapi.com/api/character/") else {completion(nil); return}
        
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let nameQuery = URLQueryItem(name: "name", value: searchTerm)
        components?.queryItems = [nameQuery]
        guard let finalURL = components?.url else {completion(nil); return}
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print ("There was an error \(error.localizedDescription)")
            }
            
            if let data = data {
                
                do {
                    
                    let characters = try  JSONDecoder().decode(TopLevelDictionary.self, from: data)
                    let character = characters.results[0]
                    self.characterSelect = character
                    completion(character)
                    
                } catch {
                    print("Error Fetching character! \(error) \(error.localizedDescription)")
                    completion(nil); return
                }
            }
        }.resume()
    }
    
    func fetchCharacterImage(character: RMcharacter, completion: @escaping (UIImage?) -> Void) {

        let imageURL = character.imageURL
        
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error {
                print("Error on image \(error.localizedDescription)")
            }
            if let data = data {
                guard let characterImage = UIImage(data: data) else {completion(nil); return}
                completion(characterImage)
            }
        }.resume()
        //let imagePathComponentURL = imageURL?.appendingPathComponent(character.image)
    }
}
