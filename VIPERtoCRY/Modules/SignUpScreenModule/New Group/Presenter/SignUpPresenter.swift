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
    func continueButtonTapped()
}

protocol SignUpInteractorOutput: class {
    
}

class SignUpPresenter {
    
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    var router: SignUpRouterInput?
    
    
    
}

extension SignUpPresenter: SignUpViewOutput {
    func continueButtonTapped() {
    
    }
    
    func backButtonTapped() {
        router?.openSignInView()
    }

}

extension SignUpPresenter: SignUpInteractorOutput {
    
}
