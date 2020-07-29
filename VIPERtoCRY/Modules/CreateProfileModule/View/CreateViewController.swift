//
//  CreateProfileViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol CreateViewInput {
    
}

class CreateViewController: UIViewController {

    var presenter: CreateViewOutput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CreateViewController: CreateViewInput {
    
}
