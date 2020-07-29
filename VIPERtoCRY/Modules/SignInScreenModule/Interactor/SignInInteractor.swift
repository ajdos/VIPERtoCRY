//
//  SignInInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol SignInInteractorInput {
    func findAUser(email: String, password: String)
}

class SignInInteractor {
    
    weak var presenter: SignInInteractorOutput?
    
    
}

extension SignInInteractor: SignInInteractorInput {
    
    func findAUser(email: String, password: String) {
         Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                   if error != nil {
                    self.presenter?.errorOccured()
                    print(error!)
                       return
                   }
                   if user != nil {
                    self.presenter?.userSignIn()
                       
                   }
            self.presenter?.noSuchUser()
               })
               
    }
    
    
}
