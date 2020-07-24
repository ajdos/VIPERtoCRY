//
//  SignInPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignInViewOutput {
    func signUpTapped()
}

protocol SignInInteractorOutput: class {
    
}

class SignInPresenter {
    
    weak var view: SingInViewInput?
    var interactor: SignInInteractorInput?
    var router: SignInRouterInput?
    
    init() {
        
    }
    
}

extension SignInPresenter: SignInInteractorOutput {
    
}

extension SignInPresenter: SignInViewOutput {
    func signUpTapped() {
        router?.openSignUpView()
    }
    
    
}
