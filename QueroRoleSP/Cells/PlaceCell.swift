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
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var priceView1: UIImageView!
    @IBOutlet weak var priceView2: UIImageView!
    @IBOutlet weak var priceView3: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var place: Place! {
        willSet(p) {
            self.photoView.image = p.photo
            self.nameLabel.text = p.name
            self.classLabel.text = p.type
            self.addressLabel.text = p.address
            switch place.price {
            case .cheap:
                self.priceLabel.text = "barato"
                self.priceView1.isHidden = false
                self.priceView2.isHidden = true
                self.priceView3.isHidden = true
            case .medium:
                self.priceLabel.text = "médio"
                self.priceView1.isHidden = true
                self.priceView2.isHidden = false
                self.priceView3.isHidden = true
            case .expensive:
                self.priceLabel.text = "caro"
                self.priceView1.isHidden = true
                self.priceView2.isHidden = true
                self.priceView3.isHidden = false
            case .free:
                self.priceLabel.text = "grátis"
                self.priceView1.isHidden = true
                self.priceView2.isHidden = true
                self.priceView3.isHidden = true
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
