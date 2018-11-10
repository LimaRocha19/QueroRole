//
//  UserCell.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickLabel: UILabel!
    
    var user: User! {
        willSet(u) {
            self.photoView.image = u.photo
            self.nameLabel.text = u.name
            self.nickLabel.text = u.nick
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.photoView.layer.cornerRadius = self.photoView.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
