//
//  RoleVC.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class RoleVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var roles: [Role] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.roles = RoleManager.roles
        self.tableView.reloadData()
    }
    
    func goTo(place: Place) {
        
        let controller = UIAlertController(title: "Navegação", message: "Escolha seu aplicativo preferido para navegar até este local", preferredStyle: .alert)
        
        if UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
            let goGoogle = UIAlertAction(title: "Google Maps", style: .default) { (action) in
                let url = google + place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: "").lowercased().folding(options: String.CompareOptions.diacriticInsensitive, locale: nil)
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goGoogle)
        }
        
        if UIApplication.shared.canOpenURL(URL(string: "waze://")!) {
            let goWaze = UIAlertAction(title: "Waze", style: .default) { (action) in
                let url = waze + place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: "").lowercased().folding(options: String.CompareOptions.diacriticInsensitive, locale: nil) + "&navigate=yes"
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goWaze)
        }
        
        if UIApplication.shared.canOpenURL(URL(string: "http://maps.apple.com/")!) {
            let goMaps = UIAlertAction(title: "Mapas", style: .default) { (action) in
                let url = maps + place.address.replacingOccurrences(of: " ", with: "%20").replacingOccurrences(of: ",", with: "%20").replacingOccurrences(of: "-", with: "").replacingOccurrences(of: ".", with: "").lowercased().folding(options: String.CompareOptions.diacriticInsensitive, locale: nil)
                UIApplication.shared.open(URL(string: url)!, options: [:], completionHandler: nil)
            }
            controller.addAction(goMaps)
        }
        
        let nope = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        controller.addAction(nope)
        
        self.present(controller, animated: true, completion: nil)
    }
}

extension RoleVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "role", for: indexPath) as! RoleCell
        cell.role = self.roles[indexPath.row]
        cell.controller = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plc = self.roles[indexPath.row].place
        self.goTo(place: plc)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 232
    }
}
