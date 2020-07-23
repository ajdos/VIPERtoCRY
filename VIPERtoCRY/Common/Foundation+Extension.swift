//
//  Foundation+Extension.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: type(of: self))
    }
    
}
