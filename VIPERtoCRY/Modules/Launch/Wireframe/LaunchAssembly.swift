//
//  LaunchAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class LaunchAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = LaunchViewController()
        let presenter = LaunchPresenter()
        let interactor = LaunchInteractor()
        let router = LaunchRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
