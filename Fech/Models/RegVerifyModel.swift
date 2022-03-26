//
//  RegVerify.swift
//  Fech
//
//  Created by MAC on 23/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation


// MARK: - RegVerify
struct RegVerify: Codable {
    let status: Bool
    let message: String
    let data: RegVerifyData?
}
struct RegVerifyData: Codable{
    
}
