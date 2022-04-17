//
//  MyFriendViewController.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import Foundation

class MyFriendsViewModel {
    var frends = [User]()
    
    func fetchFrends() {
        frends.append(User(imageName: "profile_1", name: "Savannah Tucker", speciality: "Retail Supervisor", isOnline: .offline, friends: []))
        frends.append(User(imageName: "profile_2", name: "Sam Smith", speciality: "UI/UX Designer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_3", name: "Kathryn Murphy", speciality: "Photographer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_1", name: "Jenny Wilson", speciality: "iOS developer", isOnline: .inactive, friends: []))
        frends.append(User(imageName: "profile_2", name: "Courtney Henry", speciality: "UI/UX Designer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_3", name: "Jim Warren", speciality: "iOS developer", isOnline: .offline, friends: []))
        frends.append(User(imageName: "profile_1", name: "Sam Sam", speciality: "UI/UX Designer", isOnline: .inactive, friends: []))
    }
}
