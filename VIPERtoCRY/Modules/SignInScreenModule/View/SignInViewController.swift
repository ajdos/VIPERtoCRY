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
    func displayWarningLabel(with text: String)
}

class SignInViewController: UIViewController {
    
    var presenter: SignInViewOutput?
    var scrollView = UIScrollView()
    var titleLabel = UILabel()
    var enterInfoLabel = UILabel()
    var incorrectInfoLabel = UILabel()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var signInButton = UIButton()
    var signUpButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        titleLabel.isHidden = false
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc private func enterTap(sender: UIButton!) {
        presenter?.loginTapped(with: loginTextField.text, password: passwordTextField.text)
    }
    @objc private func signUptap(sender: UIButton!) {
        presenter?.signUpTapped()
    }
    
    @objc private func keyboardDidShow(notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue

        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + keyboardSize.height / 2)
        self.scrollView.showsVerticalScrollIndicator = false

    }
    @objc private func keyboardDidHide() {
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension SignInViewController: SingInViewInput {
    func displayWarningLabel(with text: String) {
        incorrectInfoLabel.text = text
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.enterInfoLabel.alpha = 0
            self?.incorrectInfoLabel.alpha = 1
        }) { [weak self] complete in
            self?.incorrectInfoLabel.alpha = 0
            self?.enterInfoLabel.alpha = 1
        }
    }
}



extension SignInViewController {
    private func setupSubviews() {
        view.clipsToBounds = true
        navigationController?.navigationBar.isHidden = true
        incorrectInfoLabel.alpha = 0
        view.backgroundColor = .orange
        view.addSubview(scrollView)
        scrollView.autoPinEdgesToSuperviewEdges()
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4000)
        
        titleLabel.text = "Welcome to VIPER!"
        titleLabel.font = UIFont(name: "GillSans-UltraBold", size: 48)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        scrollView.addSubview(titleLabel)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        titleLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        titleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 40)
        
        enterInfoLabel.text = "Sign in to continue, please"
        enterInfoLabel.textColor = .white
        enterInfoLabel.font = .italicSystemFont(ofSize: 16)
        enterInfoLabel.textAlignment = .center
        enterInfoLabel.numberOfLines = 1
        scrollView.addSubview(enterInfoLabel)
        enterInfoLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        enterInfoLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 30)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        enterInfoLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        
        incorrectInfoLabel.text = "Incorrect E-mail or Password! Try again."
        incorrectInfoLabel.textColor = .red
        incorrectInfoLabel.font = .boldSystemFont(ofSize: 16)
        incorrectInfoLabel.textAlignment = .center
        incorrectInfoLabel.numberOfLines = 1
        scrollView.addSubview(incorrectInfoLabel)
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
        loginTextField.returnKeyType = .default
        scrollView.addSubview(loginTextField)
        loginTextField.layer.masksToBounds = true
        loginTextField.autoSetDimension(.height, toSize: 50)
        loginTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        loginTextField.autoPinEdge(.top, to: .bottom, of: incorrectInfoLabel, withOffset: 50)
        loginTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        loginTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .white
        passwordTextField.keyboardType = .default
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.clearButtonMode = .always
        passwordTextField.keyboardAppearance = .dark
        passwordTextField.returnKeyType = .default
        passwordTextField.isSecureTextEntry = true //TODO: add eye selector
        scrollView.addSubview(passwordTextField)
        passwordTextField.layer.masksToBounds = true
        passwordTextField.autoSetDimension(.height, toSize: 50)
        passwordTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        passwordTextField.autoPinEdge(.top, to: .bottom, of: loginTextField, withOffset: 10)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 30)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 30)
        
        signInButton.backgroundColor = .black
        signInButton.addTarget(self, action: #selector(enterTap), for: .touchUpInside)
        signInButton.setTitle("Enter to your account", for: .normal)
        signInButton.tintColor = .white
        signInButton.titleColor(for: .highlighted)
        scrollView.addSubview(signInButton)
        signInButton.clipsToBounds = true
        signInButton.layer.cornerRadius = 15
        signInButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        signInButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signInButton.autoPinEdge(.top, to: .bottom, of: passwordTextField, withOffset: 30)
        signInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        signInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
        
        signUpButton.backgroundColor = .black
        signUpButton.addTarget(self, action: #selector(signUptap), for: .touchUpInside)
        signUpButton.setTitle("Sign up for free", for: .normal)
        signUpButton.tintColor = .white
        signUpButton.titleColor(for: .focused)
        scrollView.addSubview(signUpButton)
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 15
        signUpButton.autoSetDimensions(to: CGSize(width: 20, height: 45))
        signUpButton.autoAlignAxis(toSuperviewAxis: .vertical)
        signUpButton.autoPinEdge(.top, to: .bottom, of: signInButton, withOffset: 20)
        signUpButton.autoPinEdge(toSuperviewEdge: .right, withInset: 65)
        signUpButton.autoPinEdge(toSuperviewEdge: .left, withInset: 65)
    }
}

