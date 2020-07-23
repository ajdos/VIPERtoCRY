//
//  SignInViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol SingInViewInput: class {
    
}

class SignInViewController: UIViewController {

    var presenter: SignInViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension SignInViewController: SingInViewInput {
    
}
