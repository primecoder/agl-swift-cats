//
//  TestCatsByOwnerGendersViewModel.swift
//  SwiftCatsTests
//
//  Created by Ace Authors on 24/4/21.
//

import XCTest
@testable import SwiftCats

class TestCatsByOwnerGendersViewModel: XCTestCase {
    
    var owners = Owners()

    override func setUpWithError() throws {
        MockedService().getOwners { self.owners = $0 }
    }

    override func tearDownWithError() throws { }

    /// Test: view model contains data and each item is correct pet's type - cat.
    func testCatsByOwnerGendersViewModel() throws {
        let vm = CatsByOwnerGendersViewModel(owners: owners)
        XCTAssertGreaterThan(vm.ownerGendersAndCats.count, 0,
                             "View Model must contain data for at least 1 gender")
        for gender in vm.ownerGendersAndCats.keys {
            if let pets = vm.ownerGendersAndCats[gender] {
                _ = pets.map {
                    XCTAssertEqual($0.type.lowercased(), "cat", "Pet must be a cat")
                }
            }
        }
    }

}
