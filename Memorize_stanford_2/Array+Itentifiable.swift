//
//  Array+Itentifiable.swift
//  Memorize_stanford_4
//
//  Created by ha tuong do on 5/15/21.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
    return 0 // TODO: bogus !
    }
}
