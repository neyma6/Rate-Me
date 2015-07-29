//
//  User.swift
//  Rate Me
//
//  Created by Gabor Csatlos on 21/07/15.
//  Copyright (c) 2015 Gabor Csatlos. All rights reserved.
//

import Foundation

class User : Processable {
    
    let id: String!
    var name: String?
    var password: String?
    
    var rateValue: Int?
    var numberOfRates: Int?
    
    var imageUrl: String?
    
    var facebookUser: Bool?
    
    init(userId id: String) {
        self.id = id
    }
    
    func toString() {
        println("id: \(id)")
        println("password: \(password)")
        println("name: \(name)")
        println("imageUrl: \(imageUrl)" )
        println("rateValue: \(rateValue)")
        println("numberOfRates: \(numberOfRates)")
        println("facebookUser: \(facebookUser)")
    }
}