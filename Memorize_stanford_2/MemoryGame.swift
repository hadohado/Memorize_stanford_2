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
    
    // func choose( let  card: Card) { // 'let' in this position is interpreted as an argument label
    // func choose(`let` card: Card) { // 'let' means card is constant, can not change it inside func
    mutating func choose(card: Card) { // <- this Card is a copy of 1 of cards above, so change it will not change cards array !!! 🧲
        
        print("card chosen: \(card)")
        let chosenIndex: Int = self.index(of: card)
        
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        // let chosenCard: Card = cards[chosenIndex] <- copy a card from an array, no longer part of array itself !
        // chosenCard.isFaceUp = !chosenCard.isFaceUp
        
        // card.isFaceUp = !card.isFaceUp // ERROR: Cannot assign to property: 'card' is a 'let' constant
    }
    
    // func index(of: Card) -> Int { // "of" is external para people use to call this func, we need inernal para
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
