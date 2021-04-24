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
    
    var ownerGenders: [Gender] { Array(owners.genders) }
    
    init(owners: Owners) {
        self.owners = owners
        self.ownerGendersAndCats = [:]
        for gender in (owners.genders.sorted { $0 < $1 }) {
            let pets = owners
                .findPetsByOwner { $0.gender.lowercased() == gender }
                .filter { $0.type.lowercased() == "cat" }
                .sorted { $0.name < $1.name }
            self.ownerGendersAndCats[gender] = pets
        }
    }
}
