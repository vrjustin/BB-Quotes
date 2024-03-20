//
//  Constants.swift
//  BB Quotes
//
//  Created by Justin Maronde on 3/20/24.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}
