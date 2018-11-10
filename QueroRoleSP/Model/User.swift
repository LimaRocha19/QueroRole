//
//  User.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var photo: UIImage
    var name: String
    var nick: String
    
    init(name: String, nick: String, photo: UIImage) {
        self.name = name
        self.nick = nick
        self.photo = photo
    }
    
    static var mockup: [User] {
        let users = [User(name: "Giovanna Bertho", nick: "gbertho", photo: UIImage(named: "gibertho")!),
                     User(name: "Andressa Dare", nick: "dessinha", photo: UIImage(named: "dessinha")!),
                     User(name: "Alessandra Almeida", nick: "ale", photo: UIImage(named: "ale")!),
                     User(name: "Camila Fragoso", nick: "cami", photo: UIImage(named: "cami")!),
                     User(name: "Fernanda Kaoli", nick: "fefs.k", photo: UIImage(named: "nanda")!),
                     User(name: "Giovana Soria", nick: "gigi", photo: UIImage(named: "gigi")!),
                     User(name: "Gabriela Bandeira", nick: "gaband", photo: UIImage(named: "gabi")!),
                     User(name: "Lívia Grassi", nick: "ligra", photo: UIImage(named: "ligra")!)]
        return users
    }
    
    static var null: User {
        return User(name: "", nick: "", photo: UIImage())
    }
}
