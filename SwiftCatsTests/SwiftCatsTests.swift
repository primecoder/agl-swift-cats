//
//  SwiftCatsTests.swift
//  SwiftCatsTests
//
//  AGL Challenge Project
//
//  Created by Ace Authors on 2021.04.23
//

import XCTest
@testable import SwiftCats

class SwiftCatsTests: XCTestCase {

    override func setUp() { }
    override func tearDown() { }

    /// Test mocked data set that they are there.
    func testVerifyMockedData() {
        
        // Test: mock data is available
        guard let data1 = TestData.catsAndOwners.data(using: .utf8) else {
            XCTFail("Mocked test data invalid or unavailable")
            return
        }
        XCTAssertGreaterThan(data1.count, 0, "Mocked data is empty")
        
        // Test: Decoding functionality
        guard let owners = try? JSONDecoder().decode(Owners.self, from: data1) else {
            XCTFail("Unable to decode json data")
            return
        }
        XCTAssertGreaterThan(owners.count, 0, "Decoded data yields empty results")
        
        // Test: Verify integrity of data
        _ = owners.map { verifyOwnerIntegrity(owner: $0) }
    }
    
    /// Test the given network service functionality and integrity.
    func testVerifyNetworkService() {
        let expectation = XCTestExpectation(description: "Remote data is available")
        NetworkService().getOwners {
            _ = $0.map { self.verifyOwnerIntegrity(owner: $0)}
            expectation.fulfill()       // Fulfilled if we reach here.
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testVerifyMockedService() {
        let expectation = XCTestExpectation(description: "Mocked data is available")
        MockedService().getOwners {
            _ = $0.map { self.verifyOwnerIntegrity(owner: $0)}
            expectation.fulfill()       // Fulfilled if we reach here.
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testVerifyCatsAndOwnersCombineService() {
        let service = CatsAndOwnersCombineService(on: DispatchQueue.global())
        sleep(5)
        _ = service.owners.map { self.verifyOwnerIntegrity(owner: $0) }
    }
    
    /// Verify that owner object contains correct properties.
    /// This function, when passes, return nothing, otherwise it fails with XCTFail.
    func verifyOwnerIntegrity(owner: Owner) {
        print("Verifying: \(owner)")
        XCTAssertTrue(!owner.name.isEmpty, "Owner name cannot be empty")
        XCTAssertTrue(!owner.gender.isEmpty, "Owner gender cannot be empty")
        XCTAssertGreaterThan(owner.age, 0, "Owner's age is invalid")
        _ = owner.pets?.map { verifyPetIntegrity(pet: $0) }
    }
    
    /// Verify that a pet has correct properties.
    /// This function, when passes, return nothing, otherwise it fails with XCTFail.
    func verifyPetIntegrity(pet: Pet) {
        print("Verifying: \(pet)")
        XCTAssertTrue(!pet.name.isEmpty, "Pet's name cannot be empty")
        XCTAssertTrue(!pet.type.isEmpty, "Pet's type cannot be empty")
    }

}
