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
    
    private(set) var model: MemoryGame<String>
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
