//
//  Character.swift
//  RickandMorty
//
//  Created by Drew Seeholzer on 6/26/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation

struct RMcharacter: Decodable {
    let id: Int
    let name: String
    let species: String
    let status: Bool
}
