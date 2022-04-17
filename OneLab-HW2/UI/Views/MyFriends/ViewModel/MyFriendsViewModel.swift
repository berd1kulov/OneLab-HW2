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
        frends.append(User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: []))
        frends.append(User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: []))
        frends.append(User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: []))
        frends.append(User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: []))
        frends.append(User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: []))
    }
}
