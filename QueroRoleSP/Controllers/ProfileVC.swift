//
//  ProfileVC.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var viewB: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.layer.cornerRadius = self.imageView.frame.height/2
        self.viewB.layer.cornerRadius = 8
    }
}
