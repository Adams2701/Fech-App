//
//  LoginViewController.swift
//  Fech
//
//  Created by MAC on 28/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginNetwork = NetworkPost()
    let persistedData = UserDefaults.standard
    
    @IBOutlet var loginEmail: UITextField!
    @IBOutlet var loginPassword: UITextField!
    @IBOutlet var LoginSecuredButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func securePassword(_ sender: Any) {
        loginPassword.isSecureTextEntry.toggle()
        let imageName = loginPassword.isSecureTextEntry ? "eye" : "eye.slash"
        LoginSecuredButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        // 1- Read values from text fields
        // 2-Check if required fields are not empty
        
        let userEmail = loginEmail.text ?? ""
        let userPassword = loginPassword.text ?? ""
        
        if (userEmail.isEmpty) || (userPassword.isEmpty) {
            // 3- Display alert message here
            
            showAlert (title: "Incomplete details", message: "Please, enter your email and password.")
            
        } else {
            CustomLoader.instance.showLoaderView()
            loginNetwork.postLoginData(email: userEmail, password: userPassword) { (loginResponse) in
                
                DispatchQueue.main.async {
                    CustomLoader.instance.hideLoaderView()
                    if loginResponse.status ?? false {
                        print("MY", loginResponse)
                        
                        self.persistedData.setUserString(value: loginResponse.data?.token ?? "", key: K.defaultTokenKey)
                        self.persistedData.setUserString(value: loginResponse.data?.user?.name ?? "", key: K.defaultNameKey)
                        self.persistedData.setUserString(value: loginResponse.data?.user?.email ?? "", key: K.defaultEmailKey)
                        self.persistedData.setUserString(value: loginResponse.data?.user?.mobile ?? "", key: K.defaultMobileKey)
                        
                        self.performSegue(withIdentifier: K.dashBoardSegue, sender: self)
                        
                    } else {
                        self.showAlert(title: "Login Error", message: loginResponse.message ?? "")
                    }
                }
            }
        }
        
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        let forgetPasswordVc = storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordWithoutTokenViewController") as! ForgetPasswordWithoutTokenViewController
        self.present(forgetPasswordVc, animated: false, completion: nil)
//
    }
    
    @IBAction func goTOSignUp(_ sender: Any) {
        let goToSignUpVc = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.present(goToSignUpVc, animated: false, completion: nil)
    }
    
}
