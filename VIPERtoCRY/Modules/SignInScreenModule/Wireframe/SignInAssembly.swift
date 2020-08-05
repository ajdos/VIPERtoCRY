//
//  SignInAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class SignInAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = SignInViewController()
        let presenter = SignInPresenter()
        let interactor = SignInInteractor()
        let router = SignInRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
