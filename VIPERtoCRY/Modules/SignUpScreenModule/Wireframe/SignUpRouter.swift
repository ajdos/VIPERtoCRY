//
//  SignUpRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignUpRouterInput {
    func openSignInView()
}

final class SignUpRouter {
     weak var transition: ModuleTransitionHandler?
       
       init(transition: ModuleTransitionHandler?) {
           self.transition = transition
       }
}

extension SignUpRouter: SignUpRouterInput {
    func openSignInView() {
        transition?.pop()
    }
    
    
}
