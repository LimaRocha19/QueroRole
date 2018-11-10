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
    var tel: String
    
    init(photo: UIImage, name: String, type: String, address: String, price: Price, zone: String, tel: String) {
        self.photo = photo
        self.name = name
        self.type = type
        self.address = address
        self.price = price
        self.zone = zone
        self.tel = tel
    }
    
    static var mockup: [Place] {
        let places = [Place(photo: UIImage(named: "athenas")!, name: "Athenas", type: "padaria", address: "R. Augusta, 1449 - Consolação, São Paulo, SP, 01305-100", price: .free, zone: "Centro", tel: "(11) 3120-5050"),
                      Place(photo: UIImage(named: "veridiana")!, name: "Pizzaria Veridiana", type: "pizzaria", address: "R. Dona Veridiana, 661 - Higienópolis, São Paulo, SP, 01238-010", price: .free, zone: "Centro", tel: "(11) 3120-5050"),
                      Place(photo: UIImage(named: "bananeira")!, name: "Bananeira", type: "restaurante", address: "R. Mal. Hastimphilo de Moura, 417 - Vila Suzana, São Paulo, SP, 05641-000", price: .free, zone: "Oeste", tel: "(11) 3542-4630")]
        return places
    }

    static var null: Place {
        return Place(photo: UIImage(), name: "", type: "", address: "", price: .free, zone: "", tel: "0")
    }
}
