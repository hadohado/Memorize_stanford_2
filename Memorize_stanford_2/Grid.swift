//
//  Grid.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/14/21.
//

import SwiftUI

// struct Grid<Item, ItemView> : View  {
struct Grid<Item, ItemView> : View where Item: Identifiable {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
        /* Assigning non-escaping parameter 'viewForItem' to an @escaping closure
           need to change function input para:
           viewForItem: (Item) ...   ->   viewForItem: @escaping (Item) ...
           closure function (Item)->ItemView will be called later in body() function, not during init()
           so we say the closure (Item)->ItemView "escape" from init() function
         
           @escaping issue happen a lot more in UIKit, but more rarely in SwiftUI
         */
    }
    
    var body: some View {
        ForEach(items) { item in
            self.viewForItem(item)
        }
        // Text("Hi, World")
    }
}

//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
