//
//  CreateProfileInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 29.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol CreateInteractorInput {
    func saveProfileInDB(photo: UIImage, phoneNumber: String, about: String, birthday: Date)
}

class CreateInteractor {
    weak var presenter: CreateInteractorOutput?
    var ref: DatabaseReference! = Database.database().reference()
    let db = Firestore.firestore()
}

extension CreateInteractor: CreateInteractorInput {
    func saveProfileInDB(photo: UIImage, phoneNumber: String, about: String, birthday: Date) {
        let currentUser = Auth.auth().currentUser
                  guard currentUser != nil else {
                      print("Current User is nil!")
                      return
                  }
                  let uId = currentUser!.uid
                  self.db.collection("users").document("\(String(describing: uId))").setData([
                    "phone" : phoneNumber,
                    "birthday" : "\(birthday)",
                    "AboutMe" : about
                  ], merge: true) { error in
                      if let error = error {
                          print("Error writing document: \(error)")
                      } else {
                          print("Document successfully written!")
                      }
                  }
    }
    
   
    
    
}
