//
//  ProgressHUD+Ext.swift
//  IOS_CleanArchitechture
//
//  Created by Le Anh Duc on 10/12/24.
//

import Foundation
import ProgressHUD

extension ProgressHUD {
    
    static func commonLoading(_ willLoading: Bool) {
        if willLoading {
            self.colorBackground = .black.withAlphaComponent(0.25)
            self.show(interaction: false)
        }
        else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.dismiss()
            }
        }
        
    }
    
}
