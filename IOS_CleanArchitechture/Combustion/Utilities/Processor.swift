//
//  Processor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

/// Simple processor for use in a decorator / proxy pattern
///
/// Decorator method that processes a value without mutation
protocol ValueProcessor<Value> {
    associatedtype Value
    func process(_ value: Value) -> Value
}
