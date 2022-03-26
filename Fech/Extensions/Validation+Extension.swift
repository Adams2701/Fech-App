//
//  Validation+extension.swift
//  Fech
//
//  Created by MAC on 11/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation

//Email validation
extension String {
    public var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    //password validation
    public var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    
    public var hasWhiteSpace: Bool {
        return self.contains(" ")
    }
    
    public var digitFormat: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^((\\+)|(00))[0-9]{6,13}$").evaluate(with: self)
        
    }
}



