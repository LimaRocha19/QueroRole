//
//  DateVC.swift
//  QueroRoleSP
//
//  Created by Giovanna Bertho on 10/11/18.
//  Copyright © 2018 querorole. All rights reserved.
//

import UIKit

class DateVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.dateLabel.text = formatter.string(from: Date())
        self.datePicker.date = Date()
        
        self.datePicker.minimumDate = Date()
    }
    
    func setDate(date: Date) {
        RoleManager.setDate(date: date)
    }
    
    func createRole() {
        let controller = UIAlertController(title: "Criar Rolê?", message: "Tem certeza de que deseja criar seu Rolê com os dados que você inseriu?", preferredStyle: .alert)
        let nope = UIAlertAction(title: "Não", style: .cancel, handler: nil)
        controller.addAction(nope)
        let yep = UIAlertAction(title: "Sim", style: .default) { (action) in
            RoleManager.storeRole()
            self.navigationController?.popToRootViewController(animated: true)
        }
        controller.addAction(yep)
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func updated(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        self.dateLabel.text = formatter.string(from: self.datePicker.date)
    }
    
    @IBAction func create(_ sender: Any) {
        self.setDate(date: self.datePicker.date)
        self.createRole()
    }
}
