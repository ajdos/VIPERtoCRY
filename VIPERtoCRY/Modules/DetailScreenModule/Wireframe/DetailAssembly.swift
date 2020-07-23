//
//  DetailAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 20.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class DetailAssembly: Assembly {
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        
        
        let userModel = model as? Model
        guard let unwrapModel = userModel else { return UsersListAssembly.assembleModule() }
        let view = DetailViewController()
        let dataProvider = DetailDataProvider()
        let presenter = DetailPresenter(detailUser: unwrapModel.user, dataProvider: dataProvider)
        let interactor = DetailInteractor()
        let router = DetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
        
    }
    
}

extension DetailAssembly {
    struct Model: TransitionModel {
        let user: User
    }

}
