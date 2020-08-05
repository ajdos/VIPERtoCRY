//
//  CreateProfilePresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol CreateViewOutput {
    func saveButtonTapped(photo: UIImage?, phoneNumber: String?, about: String?, birthday: Date?)
}

protocol CreateInteractorOutput: class {
    
}

class CreatePresenter {
    
    weak var view: CreateViewInput?
    var interactor: CreateInteractorInput?
    var router: CreateRouterInput?
    
}

extension CreatePresenter: CreateViewOutput {
    func saveButtonTapped(photo: UIImage?, phoneNumber: String?, about: String?, birthday: Date?) {
        guard let photo = photo, let phoneNumber = phoneNumber, let about = about, let birthday = birthday else { print(Error.self); return }
        
        interactor?.saveProfileInDB(photo: photo, phoneNumber: phoneNumber, about: about, birthday: birthday)
    }
    
    
}

extension CreatePresenter: CreateInteractorOutput {
    
}
