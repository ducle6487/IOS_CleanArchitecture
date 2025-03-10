//
//  ShareSheetView.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI
import UIKit

public struct ShareSheetView: UIViewControllerRepresentable {
    public typealias Callback = (_ activityType: UIActivity.ActivityType?,
                                 _ completed: Bool,
                                 _ returnedItems: [Any]?,
                                 _ error: Error?) -> Void
    
    public let activityItems: [Any]
    public let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    public let callback: Callback? = nil
    
    public init(activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    public func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: nil)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }
    
    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}
