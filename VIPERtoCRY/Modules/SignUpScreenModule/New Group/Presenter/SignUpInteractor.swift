//
//  SignUpInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol SignUpInteractorInput {
    func saveNewUser(name: String, email: String, password: String)
}

class SignUpInteractor {
    weak var presenter: SignUpInteractorOutput?
}

extension SignUpInteractor: SignUpInteractorInput {
    func saveNewUser(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                if user != nil {
                    self.presenter?.UserIsCreate()
                }
            }
        }
    }

}
