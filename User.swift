//
//  User.swift
//  friends
//
//  Created by Francisco Misael Landero Ychante on 03/03/20.
//  Copyright © 2020 Francisco Misael Landero Ychante. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var respose: [User]
}

struct User: Codable, Identifiable {

    let id : String
    let isActive : Bool
    let name: String
    let age : Int
    let company : String
    let email: String
    let address : String
    let about: String
    let registered: Date?
    
    struct Friend: Codable {
           let id : String
           let name: String
    }
   
    let tags: [String]
    let friends : [Friend]
    
}
