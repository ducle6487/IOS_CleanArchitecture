//
//  ProfileInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

final class ProfileInteractor: Interactor, ProfileInteracting {}

extension ProfileInteractor {
    public func handle(deeplink: Deeplink) {
        switch deeplink.action {
        default: break
        }
    }
}
