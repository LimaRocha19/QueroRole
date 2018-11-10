//
//  Place.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

enum Price {
    case cheap
    case medium
    case expensive
    case free
}

class Place: NSObject {
    
    var photo: UIImage
    var name: String
    var type: String
    var address: String
    var price: Price
    var zone: String
    
    init(photo: UIImage, name: String, type: String, address: String, price: Price, zone: String) {
        self.photo = photo
        self.name = name
        self.type = type
        self.address = address
        self.price = price
        self.zone = zone
    }
    
    static var mockup: [Place] {
//        let places = [Place(photo: UIImage(), name: <#T##String#>, type: <#T##String#>, address: <#T##String#>, price: <#T##Price#>)]
        return []
    }

    static var null: Place {
        return Place(photo: UIImage(), name: "", type: "", address: "", price: .free, zone: "")
    }
}
