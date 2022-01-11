//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья on 27.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .yellow
        addLayoutConstraint()
    }
    
    
    
    // MARK: - Private object's
    private var profileView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        table.tableHeaderView = profileView
        
        //table.estimatedRowHeight = profileView.bounds.height
        //table.estimatedSectionHeaderHeight = profileView.bounds.height
        
        return table
    }()
    
    // Задаём ID для секции (пока она одна, буду использовать переменную).
    fileprivate lazy var cellReuseIdentifier: String = "uniqueCellForUserPosts"
    
    
    // MARK: - Private method's
    private func addLayoutConstraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: tableView.topAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}




// MARK: - Extension (tableView protocol's)

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Данный метод, должен понимать, сколько всего ячеек будет
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // Данный метод, отвечает за заполненение ячеек данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PostTableViewCell else { fatalError() }
        let data = posts[indexPath.row]
        cell.update(name: data.author, image: data.image, description: data.description, countLikes: data.likes, countViews: data.views)
        return cell
    }
    
    
    
    /*
    func headerView(forSection section: Int) -> UITableViewHeaderFooterView? {
        var viewE = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! MyCustomHeader
                viewE.view = profileView
                return viewE
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var viewE = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as! MyCustomHeader
        viewE.view = profileView
        return viewE
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        var myCustomView = UIImageView()
        var myImage: UIImage = UIImage(named: "iconExample")!
        myCustomView.image = myImage

        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.addSubview(myCustomView)
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundView = {
            let view = profileView
            return view
        }()

        NSLayoutConstraint.activate([
            headerView.heightAnchor.constraint(equalToConstant: 220),
        ])

        return headerView
    }
    */
}
