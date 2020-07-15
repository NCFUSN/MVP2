//
//  Comment.swift
//  MVPwithNetworking
//
//  Created by SilentObserver on 15/07/2020.
//  Copyright © 2020 Nathan Furman. All rights reserved.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    let name: String
    let email: String
    let body: String
}
