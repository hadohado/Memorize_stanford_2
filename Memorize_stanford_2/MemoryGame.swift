//
//  MemoryGame.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/8/21.
//

import Foundation

// Model
struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            // this model doesn't know what the CardContent is, let emojimemorygame viewmodel does it
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex,  content: content) )
            cards.append(Card(id: pairIndex,  content: content) )
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        // full name of struct is MemoryGame.Card
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent // what is on face of card
    }
}
