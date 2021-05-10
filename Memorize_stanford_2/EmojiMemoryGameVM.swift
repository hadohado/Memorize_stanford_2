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
    
    // Cannot use instance member 'createMemoryGame' within property initializer;
    // property initializers run before 'self' is available
    
    private  var model: MemoryGame<String> = createMemoryGame()
    
    func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["😋", "💛"]
        
        return
            MemoryGame<String>( numberOfPairsOfCards: 2) { pairIndex  in return emojis[pairIndex] }
        //  MemoryGame<String>( numberOfPairsOfCards: 2, { pairIndex  in return emojis[pairIndex] } )
        //                     <--------------- init() inside MemoryGame<..>   --------------------->
        // the function "{pairIndex in return emojis[pairIndex] }" output is emojs[0] or emojis[1] ...
    }
        
/*
     init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent ) {
         cards = Array<Card>()
         for pairIndex in 0..<numberOfPairsOfCards {
             // this model doesn't know what the CardContent is, let emojimemorygame viewmodel does it
             let content = cardContentFactory(pairIndex) = emojis[0] = "😋"  or emojs[1] = "💛"
             cards.append(Card(isFaceUp: false, isMatched: false, content: content) )
             cards.append(Card(isFaceUp: false, isMatched: false, content: content) )
         }
     }
 */
    
    //  MemoryGame<String>( numberOfPairsOfCards: 2, cardContentFactory: { pairIndex  in return "😘" } )
    
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

/*
 
 MemoryGame<String>( numberOfPairsOfCards: 2, cardContentFactory: { pairIndex in return "😘" } )
 
 MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:
        pairIndex                 in  return "😘" }
      ( pairIndex: Int)           in  return "😘" }  // remove String since swift understand func will
 )
 
 MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:
    { ( pairIndex: Int) -> String in return "😘" } // move {, substitude old { with "in"
//    ( pairIndex: Int) -> String {  return "😘" }
 )
 
 MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:
    ( pairIndex: Int) -> String { return "😘" }
 )
 
 MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:
    createCardContent
 )
 
 MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: createCardContent )
 
*/
