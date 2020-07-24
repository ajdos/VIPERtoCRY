//
//  SignUpPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignUpViewOutput {
    
}

protocol SignUpInteractorOutput: class {
    
}

class SignUpPresenter {
    
    weak var view: SignUpViewInput?
    var interactor: SignUpInteractorInput?
    var router: SignUpRouterInput?
    
    
    
}

extension SignUpPresenter: SignUpViewOutput {
  
}

extension SignUpPresenter: SignUpInteractorOutput {
    
}
