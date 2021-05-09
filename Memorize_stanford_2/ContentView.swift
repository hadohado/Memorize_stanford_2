//
//  ContentView.swift
//  Memorize_stanford_2
//
//  Created by ha tuong do on 5/8/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        return HStack {
            ForEach(0..<4) {index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    var isFaceUp:  Bool  // = true
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("😆").padding().font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
