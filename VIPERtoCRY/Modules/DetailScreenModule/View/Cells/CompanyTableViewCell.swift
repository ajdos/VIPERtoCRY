//
//  CompanyTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 22.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class CompanyCell: UITableViewCell {
    
    private var userCompanyLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews() {
        userCompanyLabel.font = .boldSystemFont(ofSize: 20)
        userCompanyLabel.textColor = .black
        userCompanyLabel.textAlignment = .left
        userCompanyLabel.numberOfLines = 0
        addSubview(userCompanyLabel)
        userCompanyLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        userCompanyLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        userCompanyLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        userCompanyLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
    }
}

extension CompanyCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userCompanyLabel.text = data.userCompany
        contentView.backgroundColor = .orange
    }
}
