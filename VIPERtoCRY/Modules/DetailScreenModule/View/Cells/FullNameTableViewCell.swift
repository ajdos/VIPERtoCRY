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
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        userFullNameLabel.font = .boldSystemFont(ofSize: 20)
        userFullNameLabel.textColor = .black
        userFullNameLabel.textAlignment = .left
        userFullNameLabel.numberOfLines = 0
        addSubview(userFullNameLabel)
        userFullNameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        userFullNameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        userFullNameLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        userFullNameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
    }
}

extension FullNameCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userFullNameLabel.text = data.userFullName
        contentView.backgroundColor = .orange
    }
}
