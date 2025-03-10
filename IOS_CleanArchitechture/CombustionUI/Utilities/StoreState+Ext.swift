//
//  StoreState.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public extension StoreState {
    @ViewBuilder
    func buildViewFromState(
        @ViewBuilder loadedBlock: (DataType) -> some View,
        @ViewBuilder loadingBlock: (DataType?) -> some View,
        @ViewBuilder errorBlock: (Error) -> some View
    ) -> some View {
        switch self {
        case .loaded(let loaded):
            loadedBlock(loaded)
        case .loading(let loading):
            loadingBlock(loading)
        case .error(let error):
            errorBlock(error)
        }
    }
    
    @ViewBuilder
    func buildViewFromState(
        @ViewBuilder loadedBlock: (DataType) -> some View,
        @ViewBuilder errorBlock: (Error) -> some View
    ) -> some View {
        switch self {
        case .loaded(let loaded):
            loadedBlock(loaded)
        case .loading:
            GenericLoadingView()
        case .error(let error):
            errorBlock(error)
        }
    }
    
    @ViewBuilder
    func buildViewFromState(
        @ViewBuilder loadedBlock: (DataType) -> some View,
        @ViewBuilder loadingBlock: (DataType?) -> some View
    ) -> some View {
        switch self {
        case .loaded(let loaded):
            loadedBlock(loaded)
        case .loading(let loading):
            loadingBlock(loading)
        case .error:
            GenericErrorView()
        }
    }
    
    @ViewBuilder
    func buildViewFromState(
        @ViewBuilder loadedBlock: (DataType) -> some View
    ) -> some View {
        switch self {
        case .loaded(let loaded):
            loadedBlock(loaded)
        case .loading:
            GenericLoadingView()
        case .error:
            GenericErrorView()
        }
    }
    
    var currentValue: DataType? {
        switch self {
        case .loaded(let loaded): return loaded
        default: return nil
        }
    }
    
    var errorValue: Error? {
        switch self {
        case .error(error: let error): return error
        default: return nil
        }
    }
}
