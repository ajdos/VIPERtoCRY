//
//  DetailPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 20.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import SDWebImage
protocol DetailInteractorOutput: class {
    
}
protocol DetailViewOutput {
    func viewIsReady()
    func shareButtonTapped()
}


class DetailPresenter {
    weak var view: DetailViewInput?
    var interactor: DetailInteractorInput?
    var router: DetailRouterInput?
    private var detailUser: User?
    private let dataProvider: DetailDataProviderInput
    
    init(detailUser: User, dataProvider: DetailDataProviderInput) {
        self.detailUser = detailUser
        self.dataProvider = dataProvider
    }
    
}


extension DetailPresenter: DetailInteractorOutput {
    
}
extension DetailPresenter: DetailViewOutput {
    func viewIsReady() {
        guard let user = detailUser else { return }
        let viewModel = dataProvider.createViewModel(data: user)
        view?.update(with: viewModel)
    }
    
    func shareButtonTapped() {
        guard let imageLinkForShare = detailUser?.userPhoto else { return }
        view?.presentShareScreen(userImage: imageLinkForShare)
    }
}
