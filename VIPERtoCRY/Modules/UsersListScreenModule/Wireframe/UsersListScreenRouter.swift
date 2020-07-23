//
//  UsersListScreenRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 16.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
//Router: отвечает за навигацию между модулями.

protocol UsersListRouterInput {
    func openDetailView(with user: User)
}

class UsersListScreenRouter: UsersListRouterInput {
    
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
    
    func openDetailView(with user: User) {
        transition?.push(with: DetailAssembly.Model(user: user), openModuleType: DetailAssembly.self)
    }
}
