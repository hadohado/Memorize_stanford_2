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
        print("card chosen: \(card)")   // imbed an object in print using \(...)
            // as long as object can be turn into string for printing
    }
    
    struct Card { // full name of struct is MemoryGame.Card
        // what this card look like ?
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent // what is on face of card
            // CardContent is of type Generic
    }
}
