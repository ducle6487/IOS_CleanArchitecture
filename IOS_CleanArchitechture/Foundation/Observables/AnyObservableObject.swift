//
//  AnyObservableObject.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 6/12/24.
//

import Combine

public protocol AnyObservableObject: AnyObject {
    var objectWillChange: ObservableObjectPublisher { get }
}
