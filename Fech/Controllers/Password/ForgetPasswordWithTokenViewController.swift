//
//  ForgetPasswordWithTokenViewController.swift
//  Fech
//
//  Created by MAC on 25/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class ForgetPasswordWithTokenViewController: UIViewController {
    
    let forgetPassTokenNetwork = NetworkPost()
    var tokenEmailPassword = ""
    @IBOutlet weak var tokenLbl: UILabel!
    @IBOutlet weak var enterNewPasswordLbl: UILabel!
    @IBOutlet weak var reEnterPasswordLbl: UILabel!
    
    
    @IBOutlet weak var tokenTxt: UITextField!
    @IBOutlet weak var enterNewPasswordTxt: UITextField!
    @IBOutlet weak var reEnterPasswordTxt: UITextField!
    @IBOutlet var securedPassTokenButton1: UIButton!
    @IBOutlet var securedPassTokenButton2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tokenLbl.isHidden = true
        enterNewPasswordLbl.isHidden = true
        reEnterPasswordLbl.isHidden = true
        
        tokenTxt.delegate = self
        enterNewPasswordTxt.delegate = self
        reEnterPasswordTxt.delegate = self
    }
    
    @IBAction func resetPassword(_ sender: UIButton) {
        var token = tokenTxt.text ?? ""
        var newPassword = enterNewPasswordTxt.text ?? ""
        var reEnterPassword = reEnterPasswordTxt.text ?? ""
        
        if validateForgetPasswordForm(){
            CustomLoader.instance.showLoaderView()
            forgetPassTokenNetwork.postForgetPassToken(email:tokenEmailPassword, token: token, password: newPassword) { (forgetPassTokenRespons) in
                DispatchQueue.main.async {
                    
                    CustomLoader.instance.hideLoaderView()
                    
                    print("FogetPassToken", forgetPassTokenRespons)
                    if forgetPassTokenRespons.status {
                        print("MY", forgetPassTokenRespons)
                        let goTOLogin = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        self.present(goTOLogin, animated: false, completion: nil)
                    
                } else {
                    print("error response")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        
                        self.showAlert(title: "Registration Error", message: forgetPassTokenRespons.message)
                        
                    }
                    
                }
            }
            
        }
        
    }
    
}

@IBAction func securePasstoken1(_ sender: Any) {
    enterNewPasswordTxt.isSecureTextEntry.toggle()
    let eyeImageName = enterNewPasswordTxt.isSecureTextEntry ? "eye" : "eye.slash"
    securedPassTokenButton1.setImage(UIImage(systemName: eyeImageName), for: .normal)
}

@IBAction func securePasstoken2(_ sender: Any) {
    reEnterPasswordTxt.isSecureTextEntry.toggle()
    let eyeImageName = reEnterPasswordTxt.isSecureTextEntry ? "eye" : "eye.slash"
    securedPassTokenButton2.setImage(UIImage(systemName: eyeImageName), for: .normal)
}
func validateForgetPasswordForm() -> Bool {
    
    if tokenTxt.text?.isEmpty ?? false {
        showAlert(title: "Oops!", message: "Kindly Enter the OTP Sent to your Email")
        return false
    }
    
    if enterNewPasswordTxt.text?.isEmpty ?? false {
        showAlert(title: "Oops", message: "Please enter your password")
        return false
    }
    if enterNewPasswordTxt.text?.isValidPassword == false {
        showAlert(title: "Oops",
                  message: "Password must be alphanumeric and must be greater than 8 characters")
        return false
    }
    if reEnterPasswordTxt.text != enterNewPasswordTxt.text {
        showAlert(title: "Oops", message: "The Password entered does not match the first password entered")
        return false
    }
    return true
}
}


//display succes mesage of an email has been sent to ur email \(email)

extension ForgetPasswordWithTokenViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tokenTxt {
            tokenLbl.isHidden = false
        }
        if textField == enterNewPasswordTxt {
            enterNewPasswordLbl.isHidden = false
        }
        if textField == reEnterPasswordTxt {
            reEnterPasswordLbl.isHidden = false
        }
    }
    
}

