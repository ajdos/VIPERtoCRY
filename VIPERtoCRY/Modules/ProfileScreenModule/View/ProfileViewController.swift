//
//  ProfileViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 28.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import Firebase
protocol ProfileViewInput: class {
    
}

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewOutput?
    var photo = UIImageView()
    var nameLabel = UILabel()
    var phoneNumLabel = UILabel()
    var AboutTextView = UITextView()
    var birthday = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
        setupNavigationBar()
    }
    @objc private func settingsTap() {
        presenter?.settingsButtonTapped()
    }
    
}

extension ProfileViewController: ProfileViewInput {
    
}

extension ProfileViewController {
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        setDarkNavigationBar()
        setTitleColor(color: .white)
        self.navigationItem.setHidesBackButton(true, animated: false)
        setSettingsBarButtonItem(tintColor: .white, target: self, action: #selector(settingsTap))
        self.title = "Profile"
        
    }
    private func setupSubViews() {
        view.backgroundColor = .orange
    }
}

//MARK: Log Out code:
//func logOut() {
//    do {
//        try Auth.auth().signOut()
//    } catch {
//        print(error.localizedDescription)
//    }
//    dismiss view
//}
