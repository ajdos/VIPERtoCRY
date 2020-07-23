//
//  SetupDetailLabel.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import SDWebImage

public func setupViews(with label: UILabel) {
    label.font = .boldSystemFont(ofSize: 20)
    label.textColor = .black
    label.textAlignment = .left
    label.numberOfLines = 0
    label.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
    label.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
    label.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
    label.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
}
