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
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        userActivityLabel.font = .boldSystemFont(ofSize: 20)
        userActivityLabel.textColor = .black
        userActivityLabel.textAlignment = .left
        userActivityLabel.numberOfLines = 0
        addSubview(userActivityLabel)
        userActivityLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        userActivityLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        userActivityLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        userActivityLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
    }
}

extension ActivityCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userActivityLabel.text = data.userActivity
        contentView.backgroundColor = .orange
    }
}
