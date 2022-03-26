//
//  DashboardDetailsViewController.swift
//  Fech
//
//  Created by MAC on 02/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class profileDetails: UIViewController {
    @IBOutlet var userNameProfile: UILabel!
    @IBOutlet var userEmailProfile: UILabel!
    @IBOutlet var userPhoneProfile: UILabel!
    
    @IBOutlet var unwindProfile: UIButton!
    
    var dashh: Dashboard?
    var persistedData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue()
    }
    
    func setValue() {
        
        let email = persistedData.getUserString(key: K.defaultEmailKey)
        let mobile = persistedData.getUserString(key: K.defaultMobileKey)
        let name = persistedData.getUserString(key: K.defaultNameKey)
        
        userEmailProfile.text = email
        userPhoneProfile.text = mobile
        userNameProfile.text = name
    }
    
    @IBAction func logoutProfile(_ sender: UIButton) {
    }
    
}
