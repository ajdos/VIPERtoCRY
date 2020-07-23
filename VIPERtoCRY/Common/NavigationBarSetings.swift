//
//  NavigationBarSetings.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setDarkNavigationBar() {
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    func setTitleColor(color: UIColor) {
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    func setCustomBackIcon(tintColor: UIColor = .white ) {
        let backItem = UIBarButtonItem()
        backItem.tintColor = tintColor
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
}
