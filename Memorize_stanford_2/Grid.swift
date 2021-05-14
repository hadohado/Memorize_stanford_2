//
//  Grid.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/14/21.
//

import SwiftUI

// struct Grid<Item, ItemView> : View  {
struct Grid<Item, ItemView> : View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry  in
            body1(for:  GridLayout(itemCount: items.count, in: geometry.size))
                
            }
    }
    
    func body1(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            // body2(for: item, in: layout)
            return viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: self.index(of: item)))

            // don't do this: only show 1 card
            //   viewForItem(item)
            //   .frame(width: layout.itemSize.width, height: layout.itemSize.height)
        }
    }
    
    func body2(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }

    func index(of item: Item) -> Int {
        for index in 0..<items.count {
            if items[index].id == item.id { return index}
        }
        return 0 // TODO: bogus
    }
    
    /*
    func body1(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            body2(for: item, in: layout)
        }
    }
    
    func body2(for item: Item, in layout: GridLayout) -> some View {
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
    }
    */
}





//struct Grid_Previews: PreviewProvider {
//    static var previews: some View {
//        Grid()
//    }
//}
