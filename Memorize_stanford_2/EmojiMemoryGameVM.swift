//
//  EmojiMemoryGameVM.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/9/21.
//
// ViewModel (glue/ portal = doorway between Model and View)
//
// re-active  !! ObjservableObject + @Published
//            ViewModel publish change from var model so View can see it

import SwiftUI

class EmojiMemoryGameVM: ObservableObject { // re-active
    
    @Published private  var model: MemoryGame<String> = EmojiMemoryGameVM.createMemoryGame() // re-active
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😋", "💛", "🍒"]
        return
            MemoryGame<String>( numberOfPairsOfCards: emojis.count) { pairIndex  in return emojis[pairIndex] }
    }
    
    // MARK: - accesss to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        // objectWillChange.send() // re-active, dont need object..() since we have @Published above
        model.choose(card: card)
    }
}
