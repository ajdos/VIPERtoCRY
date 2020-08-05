//
//  ProfileInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 28.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol ProfileInteractorInput {
    
}

class ProfileInteractor {
    
    weak var presenter: ProfileInteractorOutput?
    
}

extension ProfileInteractor: ProfileInteractorInput {
    
}
