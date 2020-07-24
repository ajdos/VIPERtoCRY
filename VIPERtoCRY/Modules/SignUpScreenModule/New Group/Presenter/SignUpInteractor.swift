//
//  SignUpInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol SignUpInteractorInput {
    
}

class SignUpInteractor {
    weak var presenter: SignUpInteractorOutput?
}

extension SignUpInteractor: SignUpInteractorInput {
    
}
