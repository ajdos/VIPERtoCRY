//
//  PositionTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 22.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class PositionCell: UITableViewCell {
    
    private var userPositionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userPositionLabel)
        setupViews(with: userPositionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}

extension PositionCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userPositionLabel.text = data.userPosition
        contentView.backgroundColor = .orange
    }
}
