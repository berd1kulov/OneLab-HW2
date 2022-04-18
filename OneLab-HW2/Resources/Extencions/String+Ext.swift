//
//  String+Ext.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 18.04.2022.
//

import Foundation
import UIKit

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
