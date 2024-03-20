//
//  Character.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/20/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
    let productions: [String]
}
