//
//  ProfileViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 28.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol ProfileViewInput: class {
    
}

class ProfileViewController: UIViewController {
    
    var presenter: ProfileViewOutput?
    
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
        self.navigationItem.backBarButtonItem = nil
           setSettingsBarButtonItem(tintColor: .white, target: self, action: #selector(settingsTap))
           self.title = "Profile"
           
       }
    private func setupSubViews() {
        view.backgroundColor = .orange
    }
}


