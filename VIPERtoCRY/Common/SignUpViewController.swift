//
//  SignUpViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol SignUpViewInput: class {
    
}

class SignUpViewController: UIViewController {
    
    var presenter: SignUpViewOutput?
    var registrationLabel = UILabel()
    var instructionLabel = UILabel()
    var nameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    private func setupViews() {
        view.backgroundColor = .orange
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignUpViewController: SignUpViewInput {
    
}
