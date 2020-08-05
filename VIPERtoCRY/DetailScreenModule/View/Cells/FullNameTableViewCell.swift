//
//  LabelTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 21.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class FullNameCell: UITableViewCell {
    
    private var userFullNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userFullNameLabel)
        setupViews(with: userFullNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FullNameCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: User) {
        self.userFullNameLabel.text = data.userFullName
        contentView.backgroundColor = .orange
    }
}
