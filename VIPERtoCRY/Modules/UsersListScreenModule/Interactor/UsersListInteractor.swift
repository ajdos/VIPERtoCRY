//
//  UsersListInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 16.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
//Interactor: содержит всю бизнес-логику, необходимую для работы текущего модуля.

protocol UsersListInteractorInput {
    func getData()
    var presenter: UsersListInteractorOutput? { get set }
}

final class UsersListInteractor {
    weak var presenter: UsersListInteractorOutput?
    var networkManager: UsersListNetworkManager?
    
    
    init() {
        self.networkManager = UsersListNetworkManager()
    
    }
    

}

extension UsersListInteractor: UsersListInteractorInput {
  
    func getData() {

        networkManager?.getListPlayers(ifSuccess: { (result) in
        self.presenter?.setArray(data: result)
            
        }, ifFailure: {
            print("Error")
        })
    
    
    }
    
}

