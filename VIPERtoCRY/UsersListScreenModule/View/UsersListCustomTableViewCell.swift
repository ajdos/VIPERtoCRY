//
//  UsersListCustomTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 15.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import SDWebImage
class UsersListCustomTableViewCell: UITableViewCell {
    
    private let userImageView = UIImageView()
    
    private let userCompanyLabel = UILabel()
    private let userFullNameLabel = UILabel()
    private let userPositionLabel = UILabel()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        selectionStyle = .none
        backgroundColor = UIColor.orange
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell (_ userFullName: String, _ userPosition: String, _ userCompany: String, _ userPhoto:String) {
        
        self.userFullNameLabel.text = userFullName
        self.userPositionLabel.text = userPosition
        self.userCompanyLabel.text = userCompany
        self.userImageView.sd_setImage(with: URL(string: userPhoto), placeholderImage: #imageLiteral(resourceName: "images"))
        contentView.backgroundColor = .orange
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    
    private func setupViews() {
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        
        addSubview(userImageView)
        userImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))
        userImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        userImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        userImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        userImageView.layer.cornerRadius = 50
        
        userFullNameLabel.font = .boldSystemFont(ofSize: 16)
        userFullNameLabel.textColor = .black
        
        
        userPositionLabel.font = .boldSystemFont(ofSize: 16)
        userPositionLabel.textColor = .black
        userPositionLabel.numberOfLines = 0
        
        
        userCompanyLabel.font = .boldSystemFont(ofSize: 16)
        userCompanyLabel.textColor = .black
        
        
        let labelStack = UIStackView()
        labelStack.axis = .vertical
        labelStack.alignment = .leading
        labelStack.distribution = .fillEqually
        labelStack.addArrangedSubview(userFullNameLabel)
        labelStack.addArrangedSubview(userPositionLabel)
        labelStack.addArrangedSubview(userCompanyLabel)
        
        addSubview(labelStack)
        labelStack.autoPinEdge(.left, to: .right, of: userImageView, withOffset: 8)
        labelStack.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        labelStack.autoPinEdge(toSuperviewEdge: .top, withInset: 8)
        labelStack.autoPinEdge(toSuperviewEdge: .bottom, withInset: 8)
        
    }
}
