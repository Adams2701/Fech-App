//
//  ForgetPasswordWithoutTokenViewController.swift
//  Fech
//
//  Created by MAC on 25/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class ForgetPasswordWithoutTokenViewController: UIViewController {
    
    let forgetPasswordNetwork = NetworkPost()
    
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var emailTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLbl.isHidden = true
        
        emailTxt.delegate = self
        
        
    }
    
    @IBAction func resetPasswordPressed(_ sender: Any) {
        let email = emailTxt.text ?? ""
        
        if email.isEmpty {
            showAlert(title: "Oops!", message: "kindly enter your email")
        }
        if email.isValidEmail == false {
            self.showAlert(title: "Invalid Email", message: "Please, enter a valid email")
        }
        if email.isValidEmail == true {
            CustomLoader.instance.showLoaderView()
            forgetPasswordNetwork.postForgetPassword(email: email) { (ForgetPasswordResponds) in
                DispatchQueue.main.async {
                    CustomLoader.instance.hideLoaderView()
                    
                    print("response", ForgetPasswordResponds)
                    if ForgetPasswordResponds.status {
                        print("MY", ForgetPasswordResponds)
                        self.showAlert(title: "Get Token", message: "Click ok while you get the token sent to your email: \(email).")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                            self.performSegue(withIdentifier: K.forgetPassToken, sender: self)
                        })
                        
                    } else {
                        print("error response")
                        
                        self.showAlert(title: "Oops!", message: ForgetPasswordResponds.message)
                        
                    }
                    
                  
                }
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                          if segue.identifier == K.forgetPassToken {
                              
                              let passTokenVc = segue.destination as? ForgetPasswordWithTokenViewController
                              if let vc = passTokenVc {
                                  vc.tokenEmailPassword = self.emailTxt.text ?? ""
                              }
                              
                          }
                      }
    
}



extension ForgetPasswordWithoutTokenViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTxt {
            emailLbl.isHidden = false
        }
    }
}




