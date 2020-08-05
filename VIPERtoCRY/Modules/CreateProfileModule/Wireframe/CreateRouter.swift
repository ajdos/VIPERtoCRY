//
//  CreateProfileRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol CreateRouterInput {
    
}

class CreateRouter {
    
    var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

extension CreateRouter: CreateRouterInput {
    
}
