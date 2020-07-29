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
        navigationController?.navigationItem.backBarButtonItem?.tintColor = .white
        navigationController?.navigationItem.rightBarButtonItem?.tintColor = .white
        
    }
    
    
    func setTitleColor(color: UIColor) {
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
    }
    
    func setCustomBackIcon(tintColor: UIColor) {
        let backItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-back-200"), style: .done, target: nil, action: nil)
        backItem.tintColor = tintColor
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
    func setShareBarButtonItem(tintColor: UIColor, target: UIViewController, action: Selector?) {
        let shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: target, action: action)
        shareItem.tintColor = tintColor
        navigationItem.rightBarButtonItem = shareItem
        shareItem.style = .plain
    }
    
    func setSettingsBarButtonItem(tintColor: UIColor, target: UIViewController, action: Selector?) {
        let settingsItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-settings-50"), style: .plain, target: target, action: action)
        settingsItem.tintColor = tintColor
        navigationItem.rightBarButtonItem = settingsItem
    }
}
