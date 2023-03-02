//
//  Animal.swift
//  SampleProjectCombine
//
//  Created by Saran Nonkamjan on 28/2/2566 BE.
//

import Foundation

// MARK: - Animal
struct Animal: Codable {
    let name: String?
    let species: String?
    let foods: Foods?

    enum CodingKeys: String, CodingKey {
        case name
        case species
        case foods
    }
}

// MARK: - Foods
struct Foods: Codable {
    let likes: [String]?
    let dislikes: [String]?

    enum CodingKeys: String, CodingKey {
        case likes
        case dislikes
    }
}
