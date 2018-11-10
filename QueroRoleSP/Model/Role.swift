//
//  Role.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class Role: NSObject {
    
    var date: Date
    var companion: User
    var place: Place
    
    init(place: Place, companion: User, date: Date) {
        self.place = place
        self.companion = companion
        self.date = date
    }
    
    static var null: Role {
        return Role(place: Place.null, companion: User.null, date: Date())
    }
}
