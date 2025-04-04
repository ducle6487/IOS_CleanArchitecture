//
//  Router.swift
//  IOS_CleanArchitechture
//
//  Created by Anh Đức Lê on 9/12/24.
//

import SwiftUI

public class Router: ObservableObject, AnyObservableObject {
    // Backstack navigation type, for tracking previous navigation
    private enum NavType {
        case root
    }
    
    // MARK: - Backstack

    private var backstack: [(navType: NavType, view: RouteableView?)] = []
    
    /// Pop Root Stack
    ///
    /// Pops the root backstack, retrieving the last view in the navigation
    /// and routing it to the root view subject.
    public func pop() {
        if let last = backstack.popLast() {
            switch last.navType {
            case .root: rootViewSubject = last.view
            }
        }
    }
    
    // MARK: - Root navigation

    @Published public private(set) var rootViewSubject: RouteableView?
    @Published public private(set) var rootViewDeeplinkHandler: (any DeeplinkHandler)?
    
    /// Navigate
    ///
    /// Navigates the rootViewSubject to the provided view,
    /// wrapping it in a `RouteableView` for composition to the SwiftUI view heirarchy.
    ///
    /// Maintains the backstack for recall and navigation back to the previous location
    ///
    /// - parameter view: the view to navigate the root view subject to
    public func navigate(to view: some View, deeplinkHandler: (any DeeplinkHandler)?) {
        Task { @MainActor in
            // Add our last routeable view to the backstack for recall
            if let rootViewSubject {
                backstack.append((navType: NavType.root, view: rootViewSubject))
            }
            // Wrap our new view for composition and navigate
            rootViewSubject = RouteableView(view)
            rootViewDeeplinkHandler = deeplinkHandler
        }
    }
    
    // MARK: - Full sheet presentation

    public private(set) var fullSheetOverlaySubject: RouteableView? {
        didSet {
            // This will trigger objectWillChange on the shouldShow @Published
            shouldShowFullSheetOverlay = fullSheetOverlaySubject != nil
        }
    }

    @Published public var shouldShowFullSheetOverlay: Bool = false
    
    /// Opens a fullscreen cover with the provided view
    ///
    /// Sets the fullSheetOverlaySubject to the provided view,
    /// wrapping it in a `RouteableView` for composition to the SwiftUI view heirarchy.
    ///
    /// - parameter view: the view to open in a full screen sheet to
    public func openFullSheet(with view: some View, identifier: UUID = UUID()) {
        // Wrap our new view for composition and open
        fullSheetOverlaySubject = RouteableView(identifier: identifier, view)
    }
    
    /// Closes the fullscreen cover
    ///
    /// Sets the fullSheetOverlaySubject to not active,
    public func closeFullSheet(completion: SheetDismissCompletion? = nil) {
        shouldShowFullSheetOverlay = false
        
        // Remove our sheet content after animating down
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.fullSheetOverlaySubject = nil
            completion?()
        }
    }
    
    // MARK: - Modal sheet presentation

    public private(set) var modalSheetOverlaySubject: RouteableView? {
        didSet {
            // This will trigger objectWillChange on the shouldShow @Published
            shouldShowModalSheetOverlay = modalSheetOverlaySubject != nil
        }
    }

    @Published public var shouldShowModalSheetOverlay: Bool = false
    
    /// Opens a modal sheet cover with the provided view
    ///
    /// Sets the modalSheetOverlaySubject to the provided view,
    /// wrapping it in a `RouteableView` for composition to the SwiftUI view heirarchy.
    ///
    /// - parameter view: the view to open in a full screen sheet to
    public func openModalSheet(with view: some View, identifier: UUID = UUID()) {
        // Wrap our new view for composition and open
        modalSheetOverlaySubject = RouteableView(identifier: identifier, view)
    }
    
    /// Closes the modal sheet cover
    ///
    /// Sets the modalSheetOverlaySubject to not active,
    public func closeModalSheet() {
        modalSheetOverlaySubject = nil
    }
    
    // MARK: - Half sheet presentation

    public private(set) var halfSheetOverlaySubject: RouteableView? {
        didSet {
            // Trigger a change so our sheet content updates and can
            // calculate size for animation
            objectWillChange.send()
        
            // Delay our visibility trigger so that our view has time to compute
            // intrinsic size, then trigger objectWillChange on the shouldShow @Published
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.shouldShowHalfSheetOverlay = self.halfSheetOverlaySubject != nil
            }
        }
    }

    @Published public var shouldShowHalfSheetOverlay: Bool = false
    
    // Half sheet over another full sheet
    public private(set) var halfSheetOverSheetOverlaySubject: RouteableView? {
        didSet {
            // Trigger a change so our sheet content updates and can
            // calculate size for animation
            objectWillChange.send()
        
            // Delay our visibility trigger so that our view has time to compute
            // intrinsic size, then trigger objectWillChange on the shouldShow @Published
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.shouldShowHalfSheetOverSheetOverlay = self.halfSheetOverSheetOverlaySubject != nil
            }
        }
    }

    @Published public var shouldShowHalfSheetOverSheetOverlay: Bool = false
    
    public typealias SheetDismissCompletion = () -> Void
    
    /// Opens a half sheet cover with the provided view
    ///
    /// Sets the modalSheetOverlaySubject to the provided view,
    /// wrapping it in a `RouteableView` for composition to the SwiftUI view heirarchy.
    ///
    /// - parameter view: the view to open in a full screen sheet to
    public func openHalfSheet(
        with view: some View,
        identifier: UUID = UUID(),
        onDismiss: SheetDismissCompletion? = nil
    ) {
        // Open half sheet, if another full sheet is already open, then open the sheet over
        // Wrap our new view for composition and open
        if shouldShowFullSheetOverlay {
            halfSheetOverSheetOverlaySubject = RouteableView(identifier: identifier, onDisappear: onDismiss, view)
        } else {
            halfSheetOverlaySubject = RouteableView(identifier: identifier, onDisappear: onDismiss, view)
        }
    }
    
    /// Closes the modal sheet cover
    ///
    /// Sets the modalSheetOverlaySubject to not active,
    public func closeHalfSheet(completion: SheetDismissCompletion? = nil) {
        if shouldShowFullSheetOverlay {
            shouldShowHalfSheetOverSheetOverlay = false
        } else {
            shouldShowHalfSheetOverlay = false
        }
        
        // Remove our sheet content after animating down
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.shouldShowFullSheetOverlay {
                self.halfSheetOverSheetOverlaySubject = nil
            } else {
                self.halfSheetOverlaySubject = nil
            }
            completion?()
        }
    }
    
    // MARK: - Alert presentation

    public private(set) var alertSubject: Alert? {
        didSet {
            // This will trigger objectWillChange on the shouldShow @Published
            shouldShowAlert = alertSubject != nil
        }
    }

    @Published public var shouldShowAlert: Bool = false
    
    /// Opens an alert with the provided model
    ///
    /// - parameter alert: the alert to open
    public func openAlert(with alert: Alert) {
        // Wrap our new view for composition and open
        alertSubject = alert
    }
    
    /// Closes the alert
    ///
    /// Sets the alertSubject to not active
    public func closeAlert() {
        alertSubject = nil
    }
    
    // MARK: Dialog presentation
    
    @Published public var shouldShowDialog: Bool = false
    
    public private(set) var dialogSubject: DialogContent? {
        didSet {
            // This will trigger objectWillChange on the shouldShow @Published
            shouldShowDialog = dialogSubject != nil
        }
    }
    
    /// Opens an dialog with the provided model
    ///
    /// - parameter dialog: the dialog to open
    public func showDialog(with dialog: DialogContent) {
        // Wrap our new view for composition and open
        dialogSubject = dialog
    }
    
    /// Closes the dialog
    ///
    /// Sets the dialogSubject to not active
    public func closeDialog() {
        dialogSubject = nil
    }
    
    // MARK: Toast presentation
    
    @Published public var shouldShowToast: Bool = false
    
    public private(set) var toastSubject: String? {
        didSet {
            // This will trigger objectWillChange on the shouldShow @Published
            shouldShowToast = toastSubject != nil
        }
    }
    
    /// Opens an toast with the provided model
    ///
    /// - parameter Toast: the toast to open
    public func showToast(with toast: String) {
        // Wrap our new view for composition and open
        toastSubject = toast
    }
    
    /// Closes the toast
    ///
    /// Sets the toastSubject to not active
    public func closeToast() {
        toastSubject = nil
    }
}

// MARK: - Dependency registration

extension DependencyMap {
    private struct RouterKey: DependencyKey {
        static var dependency: Router = .init()
    }
    
    public var router: Router {
        get { resolve(key: RouterKey.self) }
        set { register(key: RouterKey.self, dependency: newValue) }
    }
}
