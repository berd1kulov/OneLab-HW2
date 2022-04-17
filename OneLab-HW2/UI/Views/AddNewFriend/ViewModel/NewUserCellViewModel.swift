//
//  NewUserCellViewModel.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import Foundation
import UIKit

class NewUserCellViewModel {
    
    func getIsOnlineColor(_ userState: IsOnline) -> UIColor {
        switch userState {
        case .online:
            return UIColor.systemGreen
        case .inactive:
            return UIColor.systemOrange
        case .offline:
            return UIColor.lightGray
        }
        return UIColor.clear
    }
}
