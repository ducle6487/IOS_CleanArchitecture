//
//  DetailRepoViewModel.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Foundation
import SwiftUI
import Combine

class DetailRepoViewModel: ObservableObject {

    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    private var bag = Set<AnyCancellable>()
    
}
