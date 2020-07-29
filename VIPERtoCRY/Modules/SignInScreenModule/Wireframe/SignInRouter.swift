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
    func openProfile()
    func openSignIn()
}

final class SignInRouter {
     weak var transition: ModuleTransitionHandler?
       
       init(transition: ModuleTransitionHandler?) {
           self.transition = transition
       }
}

extension SignInRouter: SignInRouterInput {
    func openSignIn() {
        transition?.push(moduleType: SignInAssembly.self)
    }
    
    func openSignUpView() {
        transition?.push(moduleType: SignUpAssembly.self)
    }
    func openProfile() {
        transition?.push(moduleType: ProfileAssembly.self)
    }

    
}
