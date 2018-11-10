//
//  RoleManager.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class RoleManager {
    
    static var current: Role!
    static var roles: [Role] = []
    
    static func newRole() {
        self.current = Role.null
    }
    
    static func setPlace(place: Place) {
        self.current.place = place
    }
    
    static func setCompanion(user: User) {
        self.current.companion = user
    }
    
    static func setDate(date: Date) {
        self.current.date = date
    }
    
    static func storeRole() {
        self.roles.append(self.current)
        self.current = Role.null
    }
}
