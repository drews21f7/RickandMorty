//
//  Character.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

struct RMcharacter: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case status
        case imageURL = "image"
    }
    
    let id: Int
    let name: String
    let species: String
    let status: String
    let imageURL: URL
    
    var image: UIImage? = nil
}


struct TopLevelDictionary: Decodable {
    
    let results: [RMcharacter]
}
