//
//  CatsByOwnerGendersViewModel.swift
//  SwiftCats
//
//  Created by Ace Authors on 23/4/21.
//

import Foundation

/// View Model that presents lists of cats by owners' genders.
class CatsByOwnerGendersViewModel {
    
    enum DataSource {
        case mockedService
        case networkService
    }
    
    var datasource: DataSource { didSet { loadData() } }
    
    private var owners: Owners = []
    
    /// A dictionary of genders to pets<cat>.
    var ownerGendersAndCats: [Gender : Pets] = [:]
    
    /// Convenient property that returns all genders found.
    var ownerGenders: [Gender] { Array(ownerGendersAndCats.keys.sorted { $0 > $1 }) }

    init(from datasource: DataSource = .mockedService) {
        self.datasource = datasource
        loadData()
    }
    
    func loadData() {
        print("DEBUG > loadData from: \(datasource)")
        
        self.owners = []
        self.ownerGendersAndCats = [:]
        
        switch datasource {
        case .mockedService:
            MockedService().getOwners { self.setupDataModel(from: $0) }
        case .networkService:
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.global(qos: .default).async {
                NetworkService().getOwners { self.setupDataModel(from: $0); group.leave() }
            }
            _ = group.wait(timeout: .now() + 5)
        }
    }
    
    private func setupDataModel(from owners: Owners) {
        self.owners = owners
        for gender in (owners.genders.sorted { $0 > $1 }) {     // i.e. male first, then female
            let pets = owners
                .findPetsByOwner { $0.gender.lowercased() == gender }
                .filter { $0.type.lowercased() == "cat" }
                .sorted { $0.name < $1.name }
            self.ownerGendersAndCats[gender] = pets
        }
    }
    
    
}
