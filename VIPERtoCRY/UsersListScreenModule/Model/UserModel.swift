//
//  UserInfoModel.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 15.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import UIKit

//Entity: объекты модели, не содержащие никакой бизнес-логики.

struct User: Decodable {
    var userFullName: String
    var userPosition: String
    var userCompany: String
    var userPhoto: String
    var userActivity: String
    
    enum CodingKeys: String, CodingKey {
        case userFullName = "fio"
        case userPosition = "post"
        case userCompany = "company"
        case userPhoto = "photo"
        case userActivity = "activity"
    }
}
