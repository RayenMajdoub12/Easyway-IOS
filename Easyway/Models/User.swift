//
//  User.swift
//  Easyway
//
//  Created by Rayen Majdoub on 23/3/2023.
//

import Foundation
struct User: Codable, CustomStringConvertible,Identifiable
{
    
    let id: String
    let username: String
    let email: String
    let password: String
    
    //  let image: Image?
    var description: String
    {
        return "User : username = \(username)"
    }
    
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case username   	
        case email
        case password
        //   case image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        username = try values.decode(String.self, forKey: .username)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        
    }
    
    init( id: String, username: String, email: String, password: String){
        self.username = username
        self.id = id
        self.email = email
        self.password = password
    }

    
    
}
