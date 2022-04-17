//
//  AddNewFriendViewModel.swift
//  OneLab-HW2
//
//  Created by Bakdaulet Berdikul on 17.04.2022.
//

import Foundation

class AddNewFriendViewModel {
    
    var datas: [CellConfigurator] = [CellConfigurator]()
    
    func fetchAllDatas() {
        //Contancts by Filter Names
        datas.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "book", filterByName: "From Contacts")))
        datas.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "signature", filterByName: "By Username")))
        datas.append(ContactFilterCellConfigurator(item:ContactFilter(iconName: "phone.connection", filterByName: "By Phone Number")))
        
        //All users
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_2", name: "Sam Sam", speciality: "iOS developer", isOnline: .online, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_3", name: "Sam Sam", speciality: "iOS developer", isOnline: .offline, friends: [])))
        datas.append(NewUserCellConfigurator(item: User(imageName: "profile_1", name: "Sam Sam", speciality: "iOS developer", isOnline: .inactive, friends: [])))
    }
    
}
