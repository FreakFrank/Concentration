//
//  Concentration.swift
//  Concentration
//
//  Created by Kareem Ismail on 5/31/18.
//  Copyright © 2018 Whatever. All rights reserved.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    private var indexOfOneAndOnlyFaceupCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    }
                    else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    var score = 0
    var flipsCount = 0
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard at(\(index) index out of bounds")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceupCard, matchIndex != index { // case where there is an already flipped card
                flipsCount += 1
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                }
                cards[index].isFaceUp = true
                if (cards[index].isFlippedBefore || cards[matchIndex].isFlippedBefore), !cards[index].isMatched {
                    score -= 1
                }
                cards[index].isFlippedBefore = true
                cards[matchIndex].isFlippedBefore = true
                //indexOfOneAndOnlyFaceupCard = nil                         Stupid Error -> only one card get shown from the 2 cards I pick !!!
            }
            else {
                flipsCount += 1
                indexOfOneAndOnlyFaceupCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 1, "Concentration.init must atleast have two pairs of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        var cardsTemp = cards
        cards = []
        for _ in cardsTemp { //shuffling the cards
            //let randomIndex = Int(arc4random_uniform(UInt32(cardsTemp.count)))
            cards.append(cardsTemp.remove(at: cardsTemp.count.arc4random))
        }
    }
}
