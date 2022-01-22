//
//  Models.swift
//  MVVMExample
//
//  Created by Nihal on 12/3/20.
//

import Foundation

enum Gender {
    case male, female, unspecified
}

class Person{
    var name: String
    let lastName: String
    let address: String
    let userName: String
    let gender: Gender
    var isFollowing: Bool
    
    init(name: String, lastName: String, address: String, userName: String, gender: Gender, isFollowing: Bool) {
        self.name = name
        self.lastName = lastName
        self.address = address
        self.userName = userName
        self.gender = gender
        self.isFollowing = isFollowing
    }
}
