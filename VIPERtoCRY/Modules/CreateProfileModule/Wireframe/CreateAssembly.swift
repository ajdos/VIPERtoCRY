//
//  CreateProfileAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class CreateAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        
        let view = CreateViewController()
        let presenter = CreatePresenter()
        let interactor = CreateInteractor()
        let router = CreateRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
