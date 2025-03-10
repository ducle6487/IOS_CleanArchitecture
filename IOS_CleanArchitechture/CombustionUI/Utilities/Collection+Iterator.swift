//
//  Collection+Iterator.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

public extension BidirectionalCollection where Iterator.Element: Equatable {
    typealias Element = Self.Iterator.Element

    /// Iterate over the `Collection` and return the next element after a given element
    ///
    /// - Parameters:
    ///      - item: `Element` in the collection to find the following element
    ///      - loop: `Bool` if the search should loop back to the start element
    /// - Returns: `nil` if the provided element is not in the `Collection`
    func after(_ item: Element, loop: Bool = false) -> Element? {
        if let itemIndex = self.firstIndex(of: item) {
            let lastItem: Bool = (index(after: itemIndex) == endIndex)
            if loop && lastItem {
                return self.first
            } else if lastItem {
                return nil
            } else {
                return self[index(after: itemIndex)]
            }
        }
        return nil
    }

    /// Iterate over the `Collection` and return the element before a given element
    ///
    /// - Parameters:
    ///      - item: `Element` in the collection to find the following element
    ///      - loop: `Bool` if the search should loop back to the end element
    /// - Returns: `nil` if the provided element is not in the `Collection`
    func before(_ item: Element, loop: Bool = false) -> Element? {
        if let itemIndex = self.firstIndex(of: item) {
            let firstItem: Bool = (itemIndex == startIndex)
            if loop && firstItem {
                return self.last
            } else if firstItem {
                return nil
            } else {
                return self[index(before: itemIndex)]
            }
        }
        return nil
    }
}
