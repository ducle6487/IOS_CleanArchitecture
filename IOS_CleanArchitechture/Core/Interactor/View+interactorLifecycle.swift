//
//  Untitled.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import SwiftUI

public extension View {
    func registerInteractorLifecycle(_ interactor: any Interacting) -> some View {
        self.onAppear { interactor.update() }
            .onDisappear { interactor.cancel() }
    }
}
