//
//  Card.swift
//  Concentration
//
//  Created by Kareem Ismail on 5/31/18.
//  Copyright © 2018 Whatever. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var isFlippedBefore = false
    var identifier: Int
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
