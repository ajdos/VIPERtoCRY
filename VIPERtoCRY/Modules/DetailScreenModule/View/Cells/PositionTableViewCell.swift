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
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        userPositionLabel.font = .boldSystemFont(ofSize: 20)
        userPositionLabel.textColor = .black
        userPositionLabel.textAlignment = .left
        userPositionLabel.numberOfLines = 0
        addSubview(userPositionLabel)
        userPositionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        userPositionLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        userPositionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        userPositionLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
    }
}

extension PositionCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userPositionLabel.text = data.userPosition
        contentView.backgroundColor = .orange
    }
}
