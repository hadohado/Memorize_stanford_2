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
    

    mutating func choose(card: Card) {  // <- this Card is a copy of 1 of cards above
                                        // so change it will not change cards array !!! 🧲
        
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int { // "of" is external para people use to call this func, we need inernal para
        
        for idx in 0..<cards.count {
            if cards[idx].id == card.id { return idx }
        }
        return 0 // TODO: bogus! need to fix this code
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            // this model doesn't know what the CardContent is, let emojimemorygame viewmodel does it
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2    ,  content: content) ) // fix ERROR: pairIndex -> pairIndex * 2
            cards.append(Card(id: pairIndex * 2 + 1,  content: content) ) // fix ERROR: pairIndex -> pairIndex * 2 + 1
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
