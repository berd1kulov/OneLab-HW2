//
//  AddNewFriendViewModel.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import Foundation

class AddNewFriendViewModel {
    
    var filterContactNames = [CellConfigurator]()
    var users = [CellConfigurator]()
    
    var datas: [AddNewFriendData] = [AddNewFriendData]()
    
    func fetchAllDatas() {
        //Contancts by Filter Names
        filterContactNames.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "book", filterByName: "From Contacts")))
        filterContactNames.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "signature", filterByName: "By Username")))
        filterContactNames.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "phone.connection", filterByName: "By Phone Number")))
        
        //All users
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        users.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        
        datas.append(AddNewFriendData(sectionName: "Add New Contacts", datas: filterContactNames))
        datas.append(AddNewFriendData(sectionName: "You Might Know Them", datas: users))
        
        
    }
    
}
