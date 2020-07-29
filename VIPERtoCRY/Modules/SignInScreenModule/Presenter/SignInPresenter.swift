//
//  SignInPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol SignInViewOutput {
    func signUpTapped()
    func loginTapped(with email: String?, password: String?)
    func viewIsReady()
}

protocol SignInInteractorOutput: class {
    func errorOccured()
    func noSuchUser()
    func userSignIn()
    func loginСompleted()
    func loginNotComplited()
}

class SignInPresenter {
    
    weak var view: SingInViewInput?
    var interactor: SignInInteractorInput?
    var router: SignInRouterInput?
    
    init() {
        
    }
    
}

extension SignInPresenter: SignInInteractorOutput {
    func loginСompleted() {
        router?.openProfile()
    }
    
    func loginNotComplited() {
        router?.openSignIn()
    }
    
    func errorOccured() {
        view?.displayWarningLabel(with: "Incorrect E-mail or Password! Try again.")
    }
    
    func noSuchUser() {
        view?.displayWarningLabel(with: "No such user")
    }
    func userSignIn() {
        router?.openProfile()
    }

    
}

extension SignInPresenter: SignInViewOutput {
    func viewIsReady() {
        interactor?.checkLogIn()
    }
    
    func signUpTapped() {
        router?.openSignUpView()
    }
    
    func loginTapped(with email: String?, password: String?) {
        guard let email = email, let password = password, email != "", password != "" else {
            view?.displayWarningLabel(with: "Incorrect E-mail or Password! Try again.")
            return
        }
        interactor?.findAUser(email: email, password: password)
       
    }
}
