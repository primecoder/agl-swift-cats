//
//  Owner.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import Foundation

struct Owner: Decodable {
    let name: String
    let gender: String
    let age: Int
//    let pets: [Pet]?    // aa: Fixed. Handling nil.
    let pets: Pets?         // aa: Use typealias instead.
}

// MARK: - Extension by Ace Authors, 2021.04.23 -

typealias Owners = [Owner]
typealias Pets = [Pet]
typealias Gender = String

/// Extension to Owners type with search capabilities.
extension Owners {
    
    /// Returns all genders found.
    var genders: Set<Gender> { Set(self.map { $0.gender.lowercased() }) }
    
    /// Return all ages.
    var ages: Set<Int> { Set(self.map { $0.age }) }
    
    /// Find pets by owner
    /// Default ownerSelector is to return for all owners.
    func findPetsByOwner(_ ownerSelector: (Owner) -> Bool = { _ in true } ) -> Pets {
        var allPets = Pets()
        for person in self {
            if let pets = person.pets {
                allPets.append(contentsOf: pets.filter { _ in ownerSelector(person) })
            }
        }
        return allPets
    }
}
