//
//  PhotoTableViewCell.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 21.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import SDWebImage
import NeatLayout

final class PhotoCell: UITableViewCell {
    
    private let userImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        
        addSubview(userImageView)
        userImageView.autoSetDimensions(to: CGSize(width: 300, height: 400))
        userImageView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
}


extension PhotoCell: ConfigurableCell {
    
    typealias DataType = User
    func configure(data: DataType) {
        self.userImageView.sd_setImage(with: URL(string: data.userPhoto), placeholderImage: #imageLiteral(resourceName: "images"))
        contentView.backgroundColor = .orange
        
        
    }
    
    
    
    
    
    
}
