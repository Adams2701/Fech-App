//
//  UserDefault+Extension.swift
//  Fech
//
//  Created by MAC on 09/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    //MARK: Save User in string
    func setUserString(value: String, key: String){
        set(value, forKey: key)
    
    }
    

    //MARK: Retrieve User in string
    func getUserString(key: String) -> String {
        return string(forKey:key) ?? ""
    }
}





