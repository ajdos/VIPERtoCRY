//
//  Collection+Register.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(cellTypes: [UICollectionViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
}

extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}
