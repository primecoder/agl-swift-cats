//
//  String+ext.swift
//  SwiftCats
//
//  Created by random on 25/4/21.
//

import Foundation

extension String {
    var firstCap: String {
        (self.prefix(1).capitalized + self.dropFirst())
    }
}
