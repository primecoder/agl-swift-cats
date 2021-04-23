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

typealias Owners = [Owner]  // aa: For convenient usage and readability
typealias Pets = [Pet]      // aa: For convenient usage and readability

extension Owners {
    
    /// Returns all genders found.
    var genders: Set<String> { Set(self.map { $0.gender.lowercased() }) }
    
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
