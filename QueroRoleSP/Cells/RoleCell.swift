//
//  RoleCell.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class RoleCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var companionView: UIImageView!
    @IBOutlet weak var companionLabel: UILabel!
    
    var role: Role! {
        willSet(r) {
            self.photoView.image = r.place.photo
            self.nameLabel.text = r.place.name
            self.typeLabel.text = r.place.type
            self.companionView.image = r.companion.photo
            self.companionLabel.text = r.companion.nick
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            
            self.dateLabel.text = formatter.string(from: r.date)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
