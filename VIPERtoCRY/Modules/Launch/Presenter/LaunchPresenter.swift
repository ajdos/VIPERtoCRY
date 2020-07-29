//
//  LaunchPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol LaunchViewOutput {
    func viewIsReady()
}
protocol LaunchInteractorOutput: class {
    func logInCompleted()
    func logInNotCompleted()
}

class LaunchPresenter {
    
    weak var view: LaunchViewInput?
    var interactor: LaunchInteractorInput?
    var router: LaunchRouterInput?
    
    
    
}

extension LaunchPresenter: LaunchViewOutput {
    func viewIsReady() {
        interactor?.checkAuth()
    }
    
    
}

extension LaunchPresenter: LaunchInteractorOutput {
    func logInCompleted() {
        router?.openProfile()
    }
    
    func logInNotCompleted() {
        router?.openSignInModule()
    }
    
    
}
