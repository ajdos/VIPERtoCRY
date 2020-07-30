//
//  SignUpInteractor.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 24.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Firebase

protocol SignUpInteractorInput {
    func saveNewUser(name: String, email: String, password: String)
    func signInNewUser(email: String, password: String)
    func writeDataInDB(name: String, email: String)
    func signOutCurrentUser()
}

class SignUpInteractor {
    weak var presenter: SignUpInteractorOutput?
    let db = Firestore.firestore()
    
}

extension SignUpInteractor: SignUpInteractorInput {
    func signOutCurrentUser() {
        let currentUser = Auth.auth().currentUser
        guard currentUser != nil else {
            print("Current User is nil!")
            return
        }
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            print("User sign out")
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
           
    }

     func signInNewUser(email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil {
                    
                    print("SignIn Complete!")
                    
                } else {
                    print(error!.localizedDescription)
                    print("User not found")
                    return
                }
            }
    }
    
    func saveNewUser(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil, user != nil else {
                print(error!.localizedDescription)
                return
            }
        })
        print("user saved")
    }
    
    func writeDataInDB(name: String, email: String) {
        let currentUser = Auth.auth().currentUser
            guard currentUser != nil else {
                print("Current User is nil!")
                return
            }
            let uId = currentUser!.uid
            self.db.collection("users").document("\(String(describing: uId))").setData([
                "name" : name,
                "email" : email
            ]) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    
  


