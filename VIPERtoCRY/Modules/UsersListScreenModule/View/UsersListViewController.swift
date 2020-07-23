//
//  UsersListViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 16.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import NeatLayout
protocol UsersListViewInput: class {
    
    func update()
    func startLoading()
    func stopLoading()
}

class UsersListViewController: UIViewController {
    
    
    var presenter: UsersListViewOutput?
    var activatyIndicator = UIActivityIndicatorView()
    
    
    
    private let tableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        presenter?.viewIsReady()
    }
    
    private func setupSubviews() {
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UsersListCustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
        view.addSubview(activatyIndicator)
        activatyIndicator.style = .large
        activatyIndicator.color = .white
        activatyIndicator.autoSetDimensions(to: CGSize(width: 32, height: 32))
        activatyIndicator.autoCenterInSuperview()
    }
    
    private func setupNavigationBar() {
        setDarkNavigationBar()
        setTitleColor(color: .white)
        self.title = "Forbes"
        
    }
    
    
    
}
extension UsersListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.usersArray.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UsersListCustomTableViewCell
        guard let user = presenter?.usersArray[indexPath.row] else { return UITableViewCell() }
        cell.setupCell(user.userFullName, user.userPosition, user.userCompany, user.userPhoto)
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectRow(with: indexPath)
        
    }
    
}

extension UsersListViewController: UsersListViewInput {
    func startLoading() {
        tableView.isHidden = true
        activatyIndicator.isHidden = false
        activatyIndicator.startAnimating()
    }
    
    func stopLoading() {
        activatyIndicator.isHidden = true
        tableView.isHidden = false
        activatyIndicator.stopAnimating()
    }
    
    
    
    
    
    func update() {
        stopLoading()
        tableView.reloadData()
    }
    
}

