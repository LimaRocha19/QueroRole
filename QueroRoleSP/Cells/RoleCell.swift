//
//  RoleCell.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

let google = "comgooglemaps://?daddr="
let waze = "waze://?q="
let maps = "http://maps.apple.com/?daddr="

class RoleCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var companionView: UIImageView!
    @IBOutlet weak var companionLabel: UILabel!
    
    var r: Role!
    
    var controller: UIViewController!
    
    var role: Role! {
        willSet(r) {
            self.photoView.image = r.place.photo
            self.nameLabel.text = r.place.name
//            self.typeLabel.text = r.place.type
            self.companionView.image = r.companion.photo
            self.companionLabel.text = r.companion.nick + " - " + r.companion.name
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            self.dateLabel.text = formatter.string(from: r.date) + " " + r.place.address
            
            self.r = r
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.companionView.layer.cornerRadius = self.companionView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func goTo() {
        
        let controller = UIAlertController(title: "Navegação", message: "Escolha seu aplicativo preferido para navegar até este local", preferredStyle: .alert)
        
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            let goGoogle = UIAlertAction(title: "Google Maps", style: .default) { (action) in
                let url = google + self.r.place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "")
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goGoogle)
        }
        
        if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
            let goWaze = UIAlertAction(title: "Google Maps", style: .default) { (action) in
                let url = waze + self.r.place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "")
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goWaze)
        }
        
        if UIApplication.shared.canOpenURL(URL(string: "http://maps.apple.com/")!) {
            let goMaps = UIAlertAction(title: "Google Maps", style: .default) { (action) in
                let url = maps + self.r.place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "")
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goMaps)
        }
        
        let nope = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        controller.addAction(nope)
        
        self.controller.present(controller, animated: true, completion: nil)
    }
}
