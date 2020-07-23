//
//  UsersListNetwokManager.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 16.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Alamofire



//protocol UsersListNetworkManagerProtocol {
//    func fetchDataWithAlamofire()
//
//}
class UsersListNetworkManager {
    
    
    
        func getListPlayers(ifSuccess: @escaping ([User]) -> (), ifFailure: @escaping () -> () ) {
        let urlString = "http://app.cre.ru/api8/PlayersPersonList"
            AF.request(urlString, method: .get, parameters: nil).responseJSON(completionHandler:
                { (response) in
                    
                switch response.result {
                    case .success:
                        if let data = response.data {
                            do {
                                let result = try JSONDecoder().decode(UsersData.self, from: data)
                                ifSuccess(result.data)
                            } catch {
                                ifFailure()
                            }
                        } else {
                            ifFailure()
                        }
                    case .failure:
                        ifFailure()
                        print("ERROR")
                    }
            })

        }
}
    
    
 
//
//        let request = AF.request("http://app.cre.ru/api8/PlayersPersonList", method: .get)
//        .validate().responseDecodable(of:
//
//              request("https://swapi.dev/api/films").validate().responseDecodable(of: Films.self) { (response) in
//                guard let films = response.value else { return }
//                self.films = films.all
//                self.items = films.all
//                self.tableView.reloadData()
//
//
//
//
      
        
        
        
    







//extension UsersListNetworkManager: UsersListNetworkManagerProtocol {
//    func fetchDataWithAlamofire() {
//        UsersListNetworkManager.sendRequest(url: "http://app.cre.ru/api8/PlayersPersonList")
//    }
//
//
//}

