//
//  RegistrationResponse .swift
//  Fech
//
//  Created by MAC on 12/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation

// MARK: - Reg
struct RegResponseModel: Codable {
    let status: Bool
    let message: String
    let data: RegData?
}

// MARK: - DataClass
struct RegData: Codable {
    let user: RegUser
}

// MARK: - User
struct RegUser: Codable {
    let name, email, mobile, school: String
    let department, level, createdAt: String

    enum CodingKeys: String, CodingKey {
        case name, email, mobile, school, department, level
        case createdAt = "created_at"
    }
}
