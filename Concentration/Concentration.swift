//
//  Concentration.swift
//  Concentration
//
//  Created by George on 5/11/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
            //return faceupCaedIndices.count == 1 ? faceupCaedIndices.first : nil
            //            var foundIndex: Int?
            //            for index in cards.indices {
            //                if cards[index].isFaceUp {
            //                    if foundIndex == nil {
            //                        foundIndex = index
            //                    } else {
            //                        return nil
            //                    }
            //                }
            //            }
            //            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // either no card or two cards face up
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentraion.init(\(numberOfPairsOfCards)")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        shuflleCards()
    }
    // MARK: Shuffle the cards
    private mutating func shuflleCards() {
        var shuffled = [Card]()
        for _ in 0..<cards.count
        {
            let rand = Int(arc4random_uniform(UInt32(cards.count)))
            shuffled.append(cards[rand])
            cards.remove(at: rand)
        }
        cards = shuffled
    }
}

extension Collection {
    
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

