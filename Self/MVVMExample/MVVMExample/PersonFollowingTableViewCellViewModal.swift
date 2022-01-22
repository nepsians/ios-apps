//
//  PersonFollowingTableViewCellViewModal.swift
//  MVVMExample
//
//  Created by Nihal on 12/3/20.
//

import UIKit

struct PersonFollowingTabelViewCellViewModal {
    let name: String
    let userName: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        userName = model.userName
        currentlyFollowing = model.isFollowing
        image = UIImage(systemName: "person") 
    }
}
