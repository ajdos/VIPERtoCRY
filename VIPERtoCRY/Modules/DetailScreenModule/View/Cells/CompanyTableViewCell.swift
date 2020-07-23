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
        addSubview(userCompanyLabel)
        setupViews(with: userCompanyLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CompanyCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userCompanyLabel.text = data.userCompany
        contentView.backgroundColor = .orange
    }
}


