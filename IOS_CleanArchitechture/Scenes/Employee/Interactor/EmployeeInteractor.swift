//
//  EmployeeInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

final class EmployeeInteractor: Interactor, EmployeeInteracting {}

extension EmployeeInteractor {
    func handle(deeplink: Deeplink) {
        switch deeplink.action {
        default: break
        }
    }
}
