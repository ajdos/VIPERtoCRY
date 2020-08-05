//
//  LaunchInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol LaunchInteractorInput {
    func checkAuth()
}

class LaunchInteractor {
    weak var presenter: LaunchInteractorOutput?
}

extension LaunchInteractor: LaunchInteractorInput {
    func checkAuth() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                self.presenter?.logInCompleted()
            } else {
                self.presenter?.logInNotCompleted()
            }
        }
    }
    
    
}
