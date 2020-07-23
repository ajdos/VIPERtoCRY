//
//  TableViewModel.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 22.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit.UIView

struct DetailViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case photo(configurator: CellConfiguratorProtocol)
        case name(configurator: CellConfiguratorProtocol)
        case position(configurator: CellConfiguratorProtocol)
        case company(configurator: CellConfiguratorProtocol)
        case activity(configurator: CellConfiguratorProtocol)
        var configurator: CellConfiguratorProtocol {
            
            switch self {
            case let .photo(configurator): return configurator
            case let .name(configurator): return configurator
            case let .position(configurator): return configurator
            case let .company(configurator): return configurator
            case let .activity(configurator): return configurator
            
                
               
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

