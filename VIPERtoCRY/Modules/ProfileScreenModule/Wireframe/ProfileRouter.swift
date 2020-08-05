//
//  ProfileRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 28.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileRouterInput {
    func openSettings()
}

class ProfileRouter {
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler?) {
        self.transition = transition
    }
}

extension ProfileRouter: ProfileRouterInput {
    func openSettings() {
        //TODO: routing to new screen "Settings"
    }
    
    
}
