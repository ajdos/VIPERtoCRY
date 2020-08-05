//
//  LaunchRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol LaunchRouterInput {
    func openProfile()
    func openSignInModule()
}

class LaunchRouter {
    var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

extension LaunchRouter: LaunchRouterInput {
    func openProfile() {
        transition?.push(moduleType: ProfileAssembly.self, animated: false)
    }
    
    func openSignInModule() {
        transition?.push(moduleType: SignInAssembly.self, animated: false)
    }
}
