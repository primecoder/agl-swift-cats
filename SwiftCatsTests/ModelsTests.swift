//
//  ModelsTests.swift
//  SwiftCatsTests
//
//  Created by Ace Authors on 23/4/21.
//

import XCTest
@testable import SwiftCats

/// Test data modeling.
class ModelsTests: XCTestCase {

    var owners = Owners()
    
    override func setUpWithError() throws {
        guard let data = TestData.catsAndOwners.data(using: .utf8) else {
            XCTFail("Mocked test data invalid or unavailable")
            return
        }
        guard let owners = try? JSONDecoder().decode(Owners.self, from: data) else {
            XCTFail("Unable to decode json data")
            return
        }
        self.owners = owners
    }

    override func tearDownWithError() throws { }

    func testOwnersModel() throws {
        XCTAssertGreaterThan(owners.count, 0, "No data available")
        XCTAssertGreaterThan(owners.genders.count, 0, "There must be at least 1 gender")
        XCTAssertGreaterThan(owners.ages.count, 0, "There must be at least 1 age group")
        print("Genders: \(owners.genders)")
        print("Ages: \(owners.ages.sorted { $0 < $1} )")
    }
    
    func testFindCatsByOwnerGenders() throws {
        var catsCount: Int = 0
        for gender in (owners.genders.sorted { $0 < $1 }) {
            _ = owners
                .findPetsByOwner { $0.gender.lowercased() == gender }
                .filter { $0.type.lowercased() == "cat" }
                .sorted { $0.name < $1.name }
                .map { print("Owner: \(gender), cat: \($0.name)"); catsCount += 1 }
        }
        XCTAssertGreaterThan(catsCount, 0, "There should be at least 1 cat(s)")
        
        let allCats = owners
            .findPetsByOwner()
            .filter { $0.type.lowercased() == "cat" }
        XCTAssertEqual(catsCount, allCats.count, "All cats must be checked")
    }
    
    func testFindPetsByOwnerAges() throws {
        var petsCount: Int = 0
        for age in (owners.ages.sorted { $0 < $1 }) {
            _ = owners
                .findPetsByOwner { $0.age == age }
                .sorted { $0.name < $1.name }
                .map { print("Age: \(age), \($0.type): \($0.name)"); petsCount += 1 }
        }
        let allPets = owners.findPetsByOwner()
        print("All pets count: \(allPets.count)")
        XCTAssertEqual(petsCount, allPets.count, "All pets must be checked")
    }

}
