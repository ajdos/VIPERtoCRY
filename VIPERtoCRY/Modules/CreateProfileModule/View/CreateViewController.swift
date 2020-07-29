//
//  CreateProfileViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol CreateViewInput: class {
    
}

class CreateViewController: UIViewController {

    var presenter: CreateViewOutput?
    var choisePhoto = UIImageView()
    var nameTF = UITextField()
    var birthdayPicker = UIDatePicker()
    var phoneNumberTF = UITextField()
    var aboutTF = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension CreateViewController: CreateViewInput {
    
}
