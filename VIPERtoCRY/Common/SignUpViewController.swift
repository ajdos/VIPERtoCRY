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
//TODO: Сделать возврат на предыдущий экран всплывающим со стороны с которой пришел
class SignUpViewController: UIViewController {
    
    var presenter: SignUpViewOutput?
    var registrationLabel = UILabel()
    var instructionLabel = UILabel()
    var incorrectDataLabel = UILabel()
    var nameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    var confirmPasswordTextField = UITextField()
    var continueButton = UIButton()
    var backButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setupViews()
        continueButton.isEnabled = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc private func textFieldChanged() {
        if nameTextField.text?.isEmpty == false && emailTextField.text?.isEmpty == false && emailTextField.text!.contains("@") && emailTextField.text!.contains(".") && (passwordTextField.text?.count)! >= 8 && (confirmPasswordTextField.text?.count)! >= 8 {
            continueButton.isEnabled = true
        } else {
            continueButton.isEnabled = false
        }
    }
    
    @objc private func continueTap(sender: UIButton!) {
        presenter?.continueButtonTapped()
        print("Continue Button enabled")
    }
    
    @objc private func backTap(sender: UIButton!) {
        presenter?.backButtonTapped()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignUpViewController: SignUpViewInput {
    
}




extension SignUpViewController {
    private func setupViews() {
        view.clipsToBounds = true
        incorrectDataLabel.isHidden = true
        view.backgroundColor = .orange
        
        registrationLabel.text = "Come, come my friend!"
        registrationLabel.font = UIFont(name: "GillSans-UltraBold", size: 48)
        registrationLabel.textColor = .black
        registrationLabel.textAlignment = .center
        registrationLabel.numberOfLines = 0
        view.addSubview(registrationLabel)
        registrationLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        registrationLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        registrationLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        registrationLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        
        instructionLabel.text = "Enter your name, E-mail and password(min. 8 symbols)"
        instructionLabel.textColor = .white
        instructionLabel.font = .italicSystemFont(ofSize: 16)
        instructionLabel.textAlignment = .center
        instructionLabel.numberOfLines = 2
        view.addSubview(instructionLabel)
        instructionLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        instructionLabel.autoPinEdge(.top, to: .bottom, of: registrationLabel, withOffset: 30)
        instructionLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        instructionLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        incorrectDataLabel.text = "Incorrect E-mail or Password! Try again."
        incorrectDataLabel.textColor = .red
        incorrectDataLabel.font = .boldSystemFont(ofSize: 16)
        incorrectDataLabel.textAlignment = .center
        incorrectDataLabel.numberOfLines = 1
        view.addSubview(incorrectDataLabel)
        incorrectDataLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        incorrectDataLabel.autoPinEdge(.top, to: .bottom, of: registrationLabel, withOffset: 30)
        incorrectDataLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        incorrectDataLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        nameTextField.placeholder = "Your Name"
        nameTextField.backgroundColor = .white
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        nameTextField.borderStyle = .roundedRect
        nameTextField.keyboardType = .namePhonePad
        nameTextField.clearButtonMode = .always
        nameTextField.keyboardAppearance = .dark
        nameTextField.returnKeyType = .default
        view.addSubview(nameTextField)
        nameTextField.layer.masksToBounds = true
        nameTextField.autoSetDimension(.height, toSize: 50)
        nameTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        nameTextField.autoPinEdge(.top, to: .bottom, of: incorrectDataLabel, withOffset: 50)
        nameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        nameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        emailTextField.placeholder = "Your E-mail"
        emailTextField.backgroundColor = .white
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        emailTextField.keyboardType = .emailAddress
        emailTextField.borderStyle = .roundedRect
        emailTextField.clearButtonMode = .always
        emailTextField.keyboardAppearance = .dark
        emailTextField.returnKeyType = .default
        view.addSubview(emailTextField)
        emailTextField.layer.masksToBounds = true
        emailTextField.autoSetDimension(.height, toSize: 50)
        emailTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        emailTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 10)
        emailTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        emailTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        passwordTextField.placeholder = "Your Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.keyboardType = .default
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.clearButtonMode = .always
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.returnKeyType = .default
        passwordTextField.isSecureTextEntry = true //TODO: add eye selector
        view.addSubview(passwordTextField)
        passwordTextField.layer.masksToBounds = true
        passwordTextField.autoSetDimension(.height, toSize: 50)
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        passwordTextField.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 10)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        confirmPasswordTextField.placeholder = "Confirm your Password"
        confirmPasswordTextField.backgroundColor = .white
        confirmPasswordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        confirmPasswordTextField.keyboardType = .default
        confirmPasswordTextField.borderStyle = .roundedRect
        confirmPasswordTextField.clearButtonMode = .always
        confirmPasswordTextField.keyboardAppearance = .dark
        confirmPasswordTextField.returnKeyType = .continue
        confirmPasswordTextField.isSecureTextEntry = true //TODO: add eye selector
        view.addSubview(confirmPasswordTextField)
        confirmPasswordTextField.layer.masksToBounds = true
        confirmPasswordTextField.autoSetDimension(.height, toSize: 50)
        confirmPasswordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        confirmPasswordTextField.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 10)
        confirmPasswordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        confirmPasswordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        continueButton.backgroundColor = .black
        continueButton.addTarget(self, action: #selector(continueTap), for: .touchUpInside)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.tintColor = .white
        continueButton.titleColor(for: .highlighted)
        view.addSubview(continueButton)
        continueButton.clipsToBounds = true
        continueButton.layer.cornerRadius = 15
        continueButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        continueButton.autoAlignAxis(toSuperviewAxis: .vertical)
        continueButton.autoPinEdge(.top, to: .bottom, of: confirmPasswordTextField, withOffset: 30)
        continueButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        continueButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
        
        backButton.backgroundColor = .black
        backButton.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        backButton.setTitle("Return to Log in", for: .normal)
        backButton.tintColor = .white
        backButton.titleColor(for: .focused)
        view.addSubview(backButton)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 15
        backButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        backButton.autoAlignAxis(toSuperviewAxis: .vertical)
        backButton.autoPinEdge(.top, to: .bottom, of: continueButton, withOffset: 20)
        backButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        backButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    //Скрываем клавиатуру по нажатию на текстовое поле
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
