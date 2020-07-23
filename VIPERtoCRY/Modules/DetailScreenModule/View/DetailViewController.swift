//
//  DetailViewController.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 20.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol DetailViewInput: class {
    func update(with viewModel: DetailViewModel)
    func presentShareScreen(userImage: String)
}

class DetailViewController: UIViewController {
    
    var presenter: DetailViewOutput?
    private var tableView = UITableView()
    private var detailViewModel: DetailViewModel?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupNavigationBar()
        presenter?.viewIsReady()
        
    }
    
    private func setupSubviews() {
        view.backgroundColor = .orange
        tableView.backgroundColor = .orange
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellTypes: [PhotoCell.self, FullNameCell.self, PositionCell.self, CompanyCell.self, ActivityCell.self])
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    private func setupNavigationBar() {
        setDarkNavigationBar()
        setShareBarButtonItem(tintColor: .white, target: self, action: #selector(tap))
        setCustomBackIcon(tintColor: .white)
        self.title = "Detail info"
    }
    
    @objc private func tap() {
        presenter?.shareButtonTapped()
    }
    
    
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = detailViewModel?.rows[indexPath.row] else {
            print("Failed to init cell in \(className)")
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        return cell
    }
    
    
}

extension DetailViewController: DetailViewInput {
    func presentShareScreen(userImage: String) {
        let objectsToShare = [userImage] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToTencentWeibo
        ]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    func update(with viewModel: DetailViewModel) {
        self.detailViewModel = viewModel
        tableView.reloadData()
    }
}

