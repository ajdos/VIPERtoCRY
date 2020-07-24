//
//  SignInRouter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignInRouterInput {
    func openSignUpView()
}

final class SignInRouter {
     weak var transition: ModuleTransitionHandler?
       
       init(transition: ModuleTransitionHandler?) {
           self.transition = transition
       }
}

extension SignInRouter: SignInRouterInput {
    func openSignUpView() {
        transition?.push(moduleType: SignUpAssembly.self)
    }
    
    
}
