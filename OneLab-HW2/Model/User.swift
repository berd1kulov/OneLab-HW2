//
//  User.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import Foundation

struct User {
    let imageName: String
    let name: String
    let speciality: String
    let isOnline: IsOnline
    let friends: [User]
}

enum IsOnline {
    case online
    case inactive
    case offline
}
