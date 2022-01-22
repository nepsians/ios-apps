//
//  Posts.swift
//  BeginnerApp
//
//  Created by Nihal on 12/2/20.
//

import Foundation

struct Posts: Codable{
    //var userId: Int
    public var id: Int
    public var title: String
    public var body: String
}

struct Address: Codable{
//    "street": "Kulas Light",
//    "suite": "Apt. 556",
//    "city": "Gwenborough",
//    "zipcode": "92998-3874",
    
    var street: String
    var city: String
}

struct Users: Codable{
    public var id: Int
    public var name: String
    public var email: String
    public var address: Address
}
