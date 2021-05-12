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

class EmojiMemoryGameVM: ObservableObject { // re-active
    
    // var objectWillChange: ObservableObjectPublisher <-- we get this for free when add ObservableObject
    // objectWillChange is publisher, will publish to the world when something will change
    //  so View should get ready to re-act to this change
    
    // add Published instead of objectWillChange.send() everywhere there are change
    // Published is property wrapper
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

//func createCardContent ( pairIndex: Int) -> String {
//    return "😘"
//}
