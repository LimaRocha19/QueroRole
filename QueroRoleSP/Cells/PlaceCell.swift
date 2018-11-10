//
//  PlaceCell.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
//    @IBOutlet weak var priceView1: UIImageView!
//    @IBOutlet weak var priceView2: UIImageView!
//    @IBOutlet weak var priceView3: UIImageView!
//    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    
    var place: Place! {
        willSet(p) {
            self.photoView.image = p.photo
            self.nameLabel.text = p.name
//            self.classLabel.text = p.type
            self.addressLabel.text = p.address
            self.telLabel.text = p.tel
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
