//
//  PostRequest.swift
//  Fech
//
//  Created by MAC on 09/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation

struct NetworkPost {
    
    func postLoginData(email: String, password: String, completionHandler: @escaping(LoginResponseModel) -> Void) {
        
        let url = URL(string: "https://fechng.com/api/login")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["email": email, "password": password] as [String : Any]
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do  {  if let data = data {
                let loginResponse = try JSONDecoder().decode(LoginResponseModel.self, from: data)
                completionHandler(loginResponse)
                
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    func postReg(fullName: String, email: String, phoneNumber: String, school: String, department: String, levelYear: String, password: String, completionHandler: @escaping(RegResponseModel) -> Void) {
        
        let url = URL(string: "https://fechng.com/api/register")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = [
            "name": fullName, "email": email, "mobile": phoneNumber, "school": school, "department": department, "level": levelYear, "password": password,
            ] as [String : Any]
        // the parameter key must conform with the backend keys and response if not it wont return. note pls adams
        
        print("Reg", parameters)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do  {  if let data = data {
                let regResponse = try JSONDecoder().decode(RegResponseModel.self, from: data)
                completionHandler(regResponse)
                
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    
    func postRegVerify(email: String,token: String, completionHandler: @escaping(RegVerify) -> Void) {
        
        let url = URL(string: "https://fechng.com/api/verify-profile")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["email": email, "token": token] as [String : Any]
        // the parameter key must conform with the backend keys and response if not it wont return. note pls adams
        
        print("regVerify", parameters)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do  {  if let data = data {
                let regVerifyResponse = try JSONDecoder().decode(RegVerify.self, from: data)
                completionHandler(regVerifyResponse)
                
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    
   
    func postForgetPassword(email: String, completionHandler: @escaping(ForgetPassword) -> Void) {
        
        let url = URL(string: "https://fechng.com/api/forgot-password")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["email": email] as [String : Any]
        // the parameter key must conform with the backend keys and response if not it wont return. note pls adams
        
        print("forgetPassword", parameters)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do  {  if let data = data {
                let forgetPasswordResponse = try JSONDecoder().decode(ForgetPassword.self, from: data)
                completionHandler(forgetPasswordResponse)
                
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
    func postForgetPassToken(email: String, token: String, password: String, completionHandler: @escaping(ForgetPassword) -> Void) {
        
        let url = URL(string: "https://fechng.com/api/update-password")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters = ["email": email, "token": token, "password": password] as [String : Any]
        // the parameter key must conform with the backend keys and response if not it wont return. note pls adams
        
        print("forgetPassToken", parameters)
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            do  {  if let data = data {
                let forgetPassTokenResponse = try JSONDecoder().decode(ForgetPassword.self, from: data)
                completionHandler(forgetPassTokenResponse)
                
                }
                
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
}

