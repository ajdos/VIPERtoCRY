//
//  UserListScreenAssembly.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 15.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit


//Assembly - отвечает за сборку модуля и проставление зависимостей между всеми его компонентами.

final class UsersListAssembly: Assembly {
   
    static func assembleModule() -> UIViewController {
        
        let view = UsersListViewController()
        let presenter = UsersListPresenter()
        let interactor = UsersListInteractor()
        let router = UsersListScreenRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
        
    }
    
}














//protocol Builder {
//   static func createUsersListScreen() -> UIViewController
//}
//
//class UsersListScreenBuilder: Builder {
//    static func createUsersListScreen() -> UIViewController {
//        let view = UsersListViewController()
//        return view
//    }
//}
