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
