//
//  SignUpAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class SignUpAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view =  SignUpViewController()
        let presenter = SignUpPresenter()
        let interactor = SignUpInteractor()
        let router = SignUpRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
