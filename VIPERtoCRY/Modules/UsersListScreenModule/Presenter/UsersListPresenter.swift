//
//  UsersListPresenter.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 16.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

//Presenter: получает от View информацию о действиях пользователя и преображает ее в запросы к Router’у, Interactor’у, а также получает данные от Interactor’a, подготавливает их и отправляет View для отображения.

protocol UsersListInteractorOutput: class {
    
    func setArray(data: [User])
    
}

protocol UsersListViewOutput {
    var usersArray: [User] { get }
    
    func viewIsReady()
    func selectRow(with indexPath: IndexPath)
}

final class UsersListPresenter {
    weak var view: UsersListViewInput?
    var interactor: UsersListInteractorInput?
    var router: UsersListRouterInput?
    var usersArray: [User] = []
    
    init() {
        
    }
}

extension UsersListPresenter: UsersListInteractorOutput{
    
    func setArray(data: [User]) {
        usersArray = data
        view?.update()
    }
    
}

extension UsersListPresenter: UsersListViewOutput {
    
    func viewIsReady() {
        view?.startLoading()
        interactor?.getData()
        
    }
    
    func selectRow(with IndexPath: IndexPath) {
        let user = usersArray[IndexPath.row]
        router?.openDetailView(with: user)
    }
}

