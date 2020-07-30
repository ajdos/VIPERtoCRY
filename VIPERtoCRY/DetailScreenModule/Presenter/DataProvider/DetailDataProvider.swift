//
//  DataProvider.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 22.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol DetailDataProviderInput {
    func createViewModel(data: User) -> DetailViewModel
}

final class DetailDataProvider: DetailDataProviderInput {
    
    typealias photoCellConfigurator = TableCellConfigurator<PhotoCell, PhotoCell.DataType>
    typealias nameCellConfigurator = TableCellConfigurator<FullNameCell, FullNameCell.DataType>
    typealias positionCellConfigurator = TableCellConfigurator<PositionCell, PositionCell.DataType>
    typealias companyCellConfigurator = TableCellConfigurator<CompanyCell, CompanyCell.DataType>
    typealias activityCellConfigurator = TableCellConfigurator<ActivityCell, ActivityCell.DataType>
    
    
    func createViewModel(data: User) -> DetailViewModel {
        var rows: [DetailViewModel.Row] = []
        rows.append(.photo(configurator: photoCellConfigurator(item: data)))
        if data.userFullName != "" {
            rows.append(.name(configurator: nameCellConfigurator(item: data)))
        }
        if data.userPosition != "" {
            rows.append(.position(configurator: positionCellConfigurator(item: data)))
        }
        if data.userCompany != "" {
            rows.append(.company(configurator: companyCellConfigurator(item: data)))
        }
        if data.userActivity != "" {
            rows.append(.activity(configurator: activityCellConfigurator(item: data)))
        }
        return DetailViewModel(rows: rows)
    }
    
    
}
