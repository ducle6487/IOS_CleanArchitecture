//
//  Collection+chunkedBy.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import Foundation

public extension Collection where Index: Strideable, Index.Stride == Int {
    /// Splits the collection into subsequences of a specified length.
    ///
    /// - Parameter chunkSize: The length of each subsequence.
    /// - Returns: A collection of subsequences.
    func chunked(by chunkSize: Self.Index.Stride) -> [[Element]] {
        let indices = stride(from: self.startIndex, to: self.endIndex, by: chunkSize)
        return indices.map { startIndex in
            let endIndex = self.index(startIndex, offsetBy: chunkSize, limitedBy: self.endIndex) ?? self.endIndex
            return Array(self[startIndex ..< endIndex])
        }
    }
}
