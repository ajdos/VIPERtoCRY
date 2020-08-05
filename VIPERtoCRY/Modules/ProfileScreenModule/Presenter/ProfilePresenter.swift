//
//  ProfilePresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 28.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileViewOutput {
    func settingsButtonTapped()
}
protocol ProfileInteractorOutput: class {
    
}


class ProfilePresenter {
    
    weak var view: ProfileViewInput?
    var interactor: ProfileInteractorInput?
    var router: ProfileRouterInput?
    
}

extension ProfilePresenter: ProfileViewOutput {
    func settingsButtonTapped() {
        router?.openSettings()
    }
    
    
}
extension ProfilePresenter: ProfileInteractorOutput {
    
}
