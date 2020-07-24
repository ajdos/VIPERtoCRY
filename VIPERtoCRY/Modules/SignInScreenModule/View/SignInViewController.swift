//
//  SignInViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import NeatLayout

protocol SingInViewInput: class {
    
}

class SignInViewController: UIViewController {
    
    var presenter: SignInViewOutput?
    var textFieldView = UIView()
    var titleLabel = UILabel()
    var enterInfoLabel = UILabel()
    var incorrectInfoLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var signInButton = UIButton()
    var SignUpButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        
    }
    private func setupSubviews() {
        view.clipsToBounds = true
        navigationController?.navigationBar.isHidden = true
        incorrectInfoLabel.isHidden = true
        view.backgroundColor = .orange
        titleLabel.text = "Welcome to VIPER!"
        titleLabel.font = UIFont(name: "GillSans-UltraBold", size: 48)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 80)
        enterInfoLabel.text = "Sign in to continue, please"
        enterInfoLabel.textColor = .white
        enterInfoLabel.font = .italicSystemFont(ofSize: 16)
        enterInfoLabel.textAlignment = .center
        enterInfoLabel.numberOfLines = 1
        view.addSubview(enterInfoLabel)
        enterInfoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        enterInfoLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        incorrectInfoLabel.text = "Incorrect E-mail or Password! Try again."
        incorrectInfoLabel.textColor = .red
        incorrectInfoLabel.font = .boldSystemFont(ofSize: 16)
        incorrectInfoLabel.textAlignment = .center
        incorrectInfoLabel.numberOfLines = 1
        view.addSubview(incorrectInfoLabel)
        incorrectInfoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        incorrectInfoLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        incorrectInfoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        incorrectInfoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        loginTextField.placeholder = "E-mail"
        loginTextField.backgroundColor = .white
        loginTextField.borderStyle = .roundedRect
        loginTextField.keyboardType = .emailAddress
        loginTextField.clearButtonMode = .always
        loginTextField.keyboardAppearance = .dark
        loginTextField.returnKeyType = .next
        view.addSubview(loginTextField)
        loginTextField.layer.masksToBounds = true
        loginTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        loginTextField.autoPinEdge(.top, to: .bottom, of: incorrectInfoLabel, withOffset: 50)
        loginTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        loginTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = .default
        passwordTextField.clearButtonMode = .always
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.returnKeyType = .next
        passwordTextField.isSecureTextEntry = true //TODO: add eye selector
        view.addSubview(passwordTextField)
    
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        passwordTextField.autoPinEdge(.top, to: .bottom, of: loginTextField, withOffset: 15)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignInViewController: SingInViewInput {
    
}

extension SignInViewController {
    func changeRoundCorners(_ textfield: UITextField) {
        textfield.roundCorners(corners: UIRectCorner.topRight, radius: 0.1)
        textfield.roundCorners(corners: UIRectCorner.topLeft, radius: 0.1)
        textfield.roundCorners(corners: UIRectCorner.bottomRight, radius: 0.1)
        textfield.roundCorners(corners: UIRectCorner.bottomLeft, radius: 0.1)
        
    }
}
