//
//  Card.swift
//  Concentration
//
//  Created by George on 5/11/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactor = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactor += 1
        return identifierFactor
    }
    
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

}

extension Card: Hashable {
    
    var hashValue: Int {
        return identifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
