//
//  EmojiMemoryGameVM.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/9/21.
//

// ViewModel (glue/ portal = doorway between Model and View)

// class has pointer to it
// all Views will have pointer to ViewModel
// Views live inside a house which is ViewModel
// they look out the same window to see outside world = Model !

import SwiftUI

class EmojiMemoryGameVM {
    
    private  var model: MemoryGame<String> = EmojiMemoryGameVM.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😋", "💛"]
        return
            MemoryGame<String>( numberOfPairsOfCards: 2) { pairIndex  in return emojis[pairIndex] }
    }
            
    // MARK: - accesss to the model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

func createCardContent ( pairIndex: Int) -> String {
    return "😘"
}
