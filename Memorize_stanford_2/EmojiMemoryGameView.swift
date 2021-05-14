//
//  EmojiMemoryGameView.swift ( was ContentView.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/8/21.
// re-ative !!   @ObservedObject   (to model)

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGameVM // re-active
    
//    Grid(items: viewModel.cards) { card  in
//        CardView(card: card).onTapGesture {
//            viewModel.choose(card: card)
//        }
//    }
    
    var body: some View {
        Grid(viewModel.cards, viewForItem: { card  in
            CardView(card: card).onTapGesture {
                viewModel.choose(card: card)
            }
        })
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        // GeometryReader(content: <#T##(GeometryProxy) -> _#>)
        // container view that defines its content as a function of its own size and coordinate space
        // view returns a flexible preferred size to its parent layout
        // init(content: @escaping (GeometryProxy) -> Content)
        // input argument for content function is GeometryProxy
        // output of content func is Content, which is a View
        // @frozen struct GeometryReader<Content> where Content : View
        
        GeometryReader { geometry  in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                    //Text(card.content).padding().font(Font.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            } // Z
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor ))
            // .font(Font.largeTitle)
        } // Geo
    }
    
    // MARK: - Drawing constants
    //         control panel
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3.0
    let fontScaleFactor: CGFloat = 0.75
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGameVM() )
    }
}
