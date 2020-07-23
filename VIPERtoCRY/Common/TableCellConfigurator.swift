//
//  TableCellConfigurator.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol TableCellConfiguratorProtocol {
    
    static var reuseId: String { get }
    var cellHeight: CGFloat { get }
    func configure(cell: UIView)
    
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: TableCellConfiguratorProtocol where CellType.DataType == DataType, CellType: UITableViewCell {
    var cellHeight: CGFloat
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType

    init(item: DataType, cellHeight: CGFloat = UITableView.automaticDimension) {
        self.item = item
        self.cellHeight = cellHeight
        
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}
