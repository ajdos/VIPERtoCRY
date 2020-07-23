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
        
        case photo(configurator: TableCellConfiguratorProtocol)
        case name(configurator: TableCellConfiguratorProtocol)
        case position(configurator: TableCellConfiguratorProtocol)
        case company(configurator: TableCellConfiguratorProtocol)
        case activity(configurator: TableCellConfiguratorProtocol)
        var configurator: TableCellConfiguratorProtocol {
            
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

