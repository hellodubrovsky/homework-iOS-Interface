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
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifiers.photo)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifiers.posts)
        tableView.dataSource = self
        tableView.delegate = self
        addLayoutConstraint()
        createGestureReconzerForImageUser()
    }
    
    // Реализовано для того, чтобы при возврате из photosViewController'а скрывался navigationBar.
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    // MARK: Gesture recognzer for userImage.
    
    func createGestureReconzerForImageUser() {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(clickToAvatar))
        profileView.userImage.addGestureRecognizer(gesture)
    }
    
    @objc func clickToAvatar(_ gesture: UITapGestureRecognizer) {
        print("Clicking on the avatar worked.")
    }
    
    
    
    // MARK: Private object's
    
    // ID для секциий.
    private enum cellReuseIdentifiers {
        static var photo: String = "uniqueCellForUserPhoto"
        static var posts: String = "uniqueCellForUserPosts"
    }
    
    private var profileView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.backgroundColor = .systemGray2
        return view
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.zero, style: .grouped)
        table.estimatedRowHeight = 16
        table.backgroundColor = .systemGray2
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    
    
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Данный метод, должен понимать, сколько всего ячеек будет.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == 0 else { return 4 }
        return 1
    }
    
    // Данный метод, отвечает за заполненение ячеек данными.
    /* https://medium.com/swift-gurus/generic-tableview-cells-and-sections-69c8ae241636 */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifiers.photo, for: indexPath) as? PhotosTableViewCell else { fatalError() }
            return cell
        default:
            guard let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifiers.posts, for: indexPath) as? PostTableViewCell else { fatalError() }
            let data = posts[indexPath.row]
            cell.update(name: data.author, image: data.image, description: data.description, countLikes: data.likes, countViews: data.views)
            return cell
        }
    }
    
    // Добавляем profileView в качестве header'a.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        return profileView
    }
    
    // Добавляем размер header'у.
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section == 0 else { return 0 }
        return 220
    }
    
    // Действие по нажатию на ячейку.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 && indexPath.row == 0 else { return }
        let vc = PhotosViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
