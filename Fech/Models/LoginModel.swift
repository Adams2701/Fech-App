//
//  LoginModel.swift
//  Fech
//
//  Created by MAC on 06/03/2022.
//  Copyright © 2022 MAC. All rights reserved.
//

import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Codable {
    let status: Bool?
    let message: String?
    let data: LoginData?
}

// MARK: - DataClass
struct LoginData: Codable {
    let user: LoginUser?
    let token: String?
}

// MARK: - User
struct LoginUser: Codable {
    let id: Int?
    let name, email, createdAt, updatedAt: String?
    let authToken, verified, mobile, school: String?
    let department, level, myDumps: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case authToken = "auth_token"
        case verified, mobile, school, department, level
        case myDumps = "my_dumps"
    }
}
