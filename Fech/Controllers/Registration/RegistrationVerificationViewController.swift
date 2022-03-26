//
//  RegistrationVerificationViewController.swift
//  Fech
//
//  Created by MAC on 28/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class RegistrationVerificationViewController: UIViewController {
    var regVerify = NetworkPost()
    
    @IBOutlet weak var verificationCode: UILabel!
    @IBOutlet weak var codeTextField: OneTimeCodeTextField!
    
    var verificationEmail = ""
    var persistantData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        verificationCode.text! = "Please input the verification code sent to  \(verificationEmail)"
        
        codeTextField.defaultCharacter = "-"
        codeTextField.configure()
        codeTextField.didEnterLastDigit = { [weak self] code in
            print("mYCode", code)
            let token = code
            let email = self?.verificationEmail
            
            self?.regVerify.postRegVerify(email: self?.verificationEmail ?? "", token: token) { (RegVerifyResponse) in
                DispatchQueue.main.async {
                    print("ServerResponds", RegVerifyResponse)
                    if RegVerifyResponse.status {
                        print("MY", RegVerifyResponse)
                        
                        self?.showAlert(title: "Success", message: "Click ok and Login your details at the Login Page", completionHandler: {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                let goTOLogin = self?.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                                self?.present(goTOLogin, animated: false, completion: nil)
                                
                            })
                            
                        })
                    } else {
                        print("error response")
                        self?.showAlert(title: "Login Error", message: RegVerifyResponse.message)
                    }
                }
                
            }
            
        }
    }
    
}










