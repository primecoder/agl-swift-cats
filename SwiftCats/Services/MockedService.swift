//
//  MockedService.swift
//  SwiftCats
//
//  Created by Ace Authors on 25/4/21.

import Foundation

final class MockedService {
    func getOwners(completionHandler: @escaping ([Owner]) -> Void) {
        guard
            let data = TestData.catsAndOwners.data(using: .utf8),
            let owners = try? JSONDecoder().decode(Owners.self, from: data)
        else {
            print("WARNING > MockedService > data not available")
            completionHandler([])
            return
        }
        completionHandler(owners)
    }
}
