//
//  RegistrationVerificationViewController.swift
//  Fech
//
//  Created by MAC on 28/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class RegistrationVerificationViewController: UIViewController {

    @IBOutlet var verificationCode: UILabel!
    let email:String = "Bamdek4real@gmail.com"
    override func viewDidLoad() {
        super.viewDidLoad()

        verificationCode.text! = "Please input the verification code sent to  \(email)"
        

    }
    

   

}
