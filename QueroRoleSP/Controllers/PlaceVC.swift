//
//  PlaceVC.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class PlaceVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var places: [Place] = []
    var types: [String] {
        return Array(Set(self.places.compactMap({ $0.type })))
    }
    
    var selected = Place.null

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        RoleManager.newRole()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.places = Place.mockup
        self.tableView.reloadData()
    }
}

extension PlaceVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.types.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.types.indices.contains(section) {
            let type = self.types[section]
            let plcs = self.places.filter({ $0.type == type })
            return plcs.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.types.indices.contains(indexPath.section) {
            let type = self.types[indexPath.section]
            let plc = self.places.filter({ $0.type == type })[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! PlaceCell
            cell.place = plc
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! PlaceCell
            cell.place = Place.null
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.types.indices.contains(indexPath.section) {
            let type = self.types[indexPath.section]
            let plc = self.places.filter({ $0.type == type })[indexPath.row]
            self.selected = plc
            RoleManager.setPlace(place: self.selected)
            self.performSegue(withIdentifier: "users", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return self.types[section]
    }
}
