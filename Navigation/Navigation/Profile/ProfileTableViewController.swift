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
        tableView.dataSource = self
        tableView.delegate = self
        addLayoutConstraint()
        setupTapGesture()
    }
    
    
    // MARK: Private object's
    private var profileView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray
        return view
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: .grouped)
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // Задаём ID для секции (пока она одна, буду использовать переменную).
    fileprivate lazy var cellReuseIdentifier: String = "uniqueCellForUserPosts"
    
    
    // MARK: Private method's
    private func addLayoutConstraint() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}





// MARK: - Extension (tableView protocol's)

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Данный метод, должен понимать, сколько всего ячеек будет.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    // Данный метод, отвечает за заполненение ячеек данными.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PostTableViewCell else { fatalError() }
        let data = posts[indexPath.row]
        cell.update(name: data.author, image: data.image, description: data.description, countLikes: data.likes, countViews: data.views)
        return cell
    }
    
    // Добавляем profileView в качестве header'a.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileView
       
    }
    
    // Добавляем размер header'у.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
}





// MARK: - Keyboard

extension ProfileViewController {

    // Hiding the keyboard by tap.
    /* https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded */
    
    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapDismiss)))
    }

    @objc fileprivate func handleTapDismiss() {
        view.endEditing(true)
    }
}
