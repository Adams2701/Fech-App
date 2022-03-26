//
//  ForgetPasswordViewController.swift
//  Fech
//
//  Created by MAC on 28/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class ForgetPasswordWithoutTokenViewController: UIViewController {
    let forgetPasswordNetwork = PostRequest()
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.isHidden = true
        emailText.delegate = self
        
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        var emailAddress = emailText.text ?? ""
        if emailAddress.isEmpty {
            showAlert(title: "Oops!", message: "Kindly input your email")
        }
        
        if emailAddress.isValidEmail == false {
            self.showAlert(title: "Invalid Email", message: "Please, enter a valid email")
        }
        
        if emailAddress.isValidEmail == true {
            CustomLoader.instance.showLoaderView()
            forgetPasswordNetwork.postForgetPassword(email: emailAddress) { (ForgetPasswordResponse) in
                DispatchQueue.main.async {
                    CustomLoader.instance.hideLoaderView()
                    if ForgetPasswordResponse.status {
                        print("MY", ForgetPasswordResponse)
                        self.showAlert(title: "Token", message: "click ok while you get the token sent to your email \(emailAddress).")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            self.performSegue(withIdentifier: K.forgetPassword, sender: self)
                        })
                    } else {
                        self.showAlert(title: "forget Password Error", message: ForgetPasswordResponse.message ?? "")
                    }
                }
            }
        }
    }
}

extension ForgetPasswordWithoutTokenViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailText {
            emailLabel.isHidden = false
        }
    }
    
}
