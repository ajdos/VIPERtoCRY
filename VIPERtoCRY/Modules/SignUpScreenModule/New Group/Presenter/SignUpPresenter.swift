//
//  SignUpPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignUpViewOutput {
    func backButtonTapped()
    func continueButtonTapped(name: String?, email: String?, password: String?, confirmPassword: String?)
}

protocol SignUpInteractorOutput: class {
    func UserIsCreate()
}

class SignUpPresenter {
    
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    var router: SignUpRouterInput?
    
    
    
}

extension SignUpPresenter: SignUpViewOutput {
    func continueButtonTapped(name: String?, email: String?, password: String?, confirmPassword: String?) {
        if password == confirmPassword {
    guard let email = email, let password = password, let name = name, name != "", email != "", password != "" else {
               view?.displayWarningLabel(with: "Incorrect E-mail or Password! Try again.")
               return
           }
        interactor?.saveNewUser(name: name, email: email, password: password)
        } else {
            view?.displayWarningLabel(with: "Passwords must match")
        }
    }
    func backButtonTapped() {
        router?.openSignInView()
    }

}

extension SignUpPresenter: SignUpInteractorOutput {
    func UserIsCreate() {
        router?.openProfile()
    }
}
