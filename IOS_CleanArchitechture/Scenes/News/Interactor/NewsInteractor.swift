//
//  NewsInteractor.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

final class NewsInteractor: Interactor, NewsInteracting {}

extension NewsInteractor {
    func handle(deeplink: Deeplink) {
        switch deeplink.action {
        default: break
        }
    }
}
