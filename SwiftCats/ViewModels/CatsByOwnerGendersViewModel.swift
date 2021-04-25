//
//  CatsByOwnerGendersViewModel.swift
//  SwiftCats
//
//  Created by Ace Authors on 23/4/21.
//

import Foundation

/// View Model that presents lists of cats by owners' genders.
struct CatsByOwnerGendersViewModel {
    
    private let owners: Owners
    
    /// A dictionary of genders to pets<cat>.
    var ownerGendersAndCats: [Gender : Pets]
    
    /// Convenient property that returns all genders found.
    var ownerGenders: [Gender] { Array(ownerGendersAndCats.keys.sorted { $0 > $1 }) }

    init(owners: Owners) {
        self.owners = owners
        self.ownerGendersAndCats = [:]
        for gender in (owners.genders.sorted { $0 > $1 }) {     // i.e. male first, then female
            let pets = owners
                .findPetsByOwner { $0.gender.lowercased() == gender }
                .filter { $0.type.lowercased() == "cat" }
                .sorted { $0.name < $1.name }
            self.ownerGendersAndCats[gender] = pets
        }
    }
}
