//
//  LaunchViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol LaunchViewInput: class {
    
}

class LaunchViewController: UIViewController {

    var presenter: LaunchViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        presenter?.viewIsReady()
    }

}

extension LaunchViewController: LaunchViewInput {
    
}
