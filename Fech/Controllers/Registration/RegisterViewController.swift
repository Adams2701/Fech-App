//
//  RegisterViewController.swift
//  Fech
//
//  Created by MAC on 28/02/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    var persistedData = UserDefaults.standard
    var regNetwork = NetworkPost()
    
    @IBOutlet var fullName: UITextField!
    @IBOutlet var regEmail: UITextField!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var schoolName: UITextField!
    @IBOutlet var department: UITextField!
    @IBOutlet var levelYear: UITextField!
    @IBOutlet var regPassword: UITextField!
    @IBOutlet var securedButton: UIButton!
    
    @IBOutlet var namefull: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var school: UILabel!
    @IBOutlet var departm: UILabel!
    @IBOutlet var year: UILabel!
    @IBOutlet var passwrd: UILabel!
    
    //    let alert = UIAlertController(title: nil, message: "Kindly Wait...", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        
    }
    // the hide label above the txtfield
    
    func resetForm(){
        namefull.isHidden = true
        email.isHidden = true
        phone.isHidden = true
        school.isHidden = true
        departm.isHidden = true
        year.isHidden = true
        passwrd.isHidden = true
    }
    
    // Validate required fields are not empty & fully certain responsibilty
    
    func validateTextField() -> Bool {
        
        if !fullName.text!.hasWhiteSpace {
            self.showAlert(title: "Oops", message: "Please, enter your firstname and lastname")
            return false
        }
        if fullName.text == "" {
            self.showAlert(title: "Oops", message: "Please, enter your full name")
            return false
            
        }
        if regEmail.text == "" {
            self.showAlert(title: "Oops", message: "Please, enter your email")
            return false
            
        }
        if regEmail.text!.isValidEmail == false {
            self.showAlert(title: "Invalid Email", message: "Please, enter a valid email")
            return false
            
        }
        if phoneNumber.text == "" {
            showAlert(title: "Oops", message: "please enter your phone number")
            return false
            
        }
        if phoneNumber.text?.digitFormat == false {
            showAlert(title: "Oops", message: "Please enter correct and complete phone number")
            return false
            
        }
        if schoolName.text == "" {
            showAlert(title: "Oops", message: "Please enter your school name")
            return false
            
        }
        if department.text == ""{
            showAlert(title: "Oops", message: "Please enter your department name")
            return false
            
        }
        if levelYear.text?.count == 0 {
            showAlert(title: "Oops", message: "please enter your levelYear")
            return false
            
        }
        if regPassword.text == "" {
            self.showAlert(title: "Oops", message: "Please enter your password")
            return false
            
        }
        if regPassword.text!.isValidPassword == false {
            self.showAlert(title: "Oops",
                           message: "Password must be alphanumeric and must be greater than 8 characters")
            
        }
        return true
    }
    
    @IBAction func securePassword(_ sender: Any) {
        regPassword.isSecureTextEntry.toggle()
        let eyeImageName = regPassword.isSecureTextEntry ? "eye" : "eye.slash"
        securedButton.setImage(UIImage(systemName: eyeImageName), for: .normal)
    }
    
    @IBAction func regButton(_ sender: UIButton) {
        if validateTextField(){
            
            CustomLoader.instance.showLoaderView()
            
            let regFullName = fullName.text ?? ""
            let regEmai = regEmail.text ?? ""
            let regPhoneNumber = phoneNumber.text ?? ""
            let regSchool = schoolName.text ?? ""
            let regDepartment = department.text ?? ""
            let regLevelYear = levelYear.text ?? ""
            let regPasswrd = regPassword.text ?? ""
            
            regNetwork.postReg(fullName: regFullName, email:regEmai , phoneNumber: regPhoneNumber, school: regSchool, department: regDepartment, levelYear: regLevelYear, password: regPasswrd) { (RegResponse) in
                
                DispatchQueue.main.async {
                    
                    CustomLoader.instance.hideLoaderView()
                    
                    print("response", RegResponse)
                    if RegResponse.status {
                        print("MY", RegResponse)
                        self.persistedData.setUserString(value: RegResponse.data?.user.email ?? "", key: K.defaultEmailKey)
                        
                        self.performSegue(withIdentifier: K.regVerifySegue, sender: self)
                        
                    } else {
                        print("error response")
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            self.showAlert(title: "Registration Error", message: RegResponse.message)
                            
                        }
                        
                    }
                }
                
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.regVerifySegue {
            let regVerifyController = segue.destination as? RegistrationVerificationViewController
            if let vc = regVerifyController {
                vc.verificationEmail = regEmail.text ?? ""
            }
        }
    }
    
    @IBAction func login(_ sender: Any) {
        let loginVc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginVc, animated: false, completion: nil)
        
    }
    
}
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == fullName {
            namefull.isHidden = false
        }
        if textField == regEmail{
            email.isHidden = false
        }
        if textField == phoneNumber{
            phone.isHidden = false
        }
        if textField == schoolName{
            school.isHidden = false
        }
        if textField == department{
            departm.isHidden = false
        }
        if textField == levelYear{
            year.isHidden = false
        }
        if textField == regPassword{
            passwrd.isHidden = false
        }
    }
    
}

