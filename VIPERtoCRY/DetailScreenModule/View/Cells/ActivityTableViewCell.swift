//
//  ActivityTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 22.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {
    
    private var userActivityLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userActivityLabel)
        setupViews(with: userActivityLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActivityCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userActivityLabel.text = data.userActivity
        contentView.backgroundColor = .orange
    }
}
