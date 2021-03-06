//
//  Configurable.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//


protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}
