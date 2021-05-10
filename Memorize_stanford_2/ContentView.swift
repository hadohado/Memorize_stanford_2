//
//  ContentView.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGameVM
    
    var body: some View {
        return HStack {
            ForEach(viewModel.cards) {card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(card.content).padding().font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGameVM() )
    }
}
