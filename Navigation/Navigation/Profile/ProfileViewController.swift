//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья on 27.11.2021.
//

// MARK: 5. Создайте экземпляр класса ProfileHeaderView в классе ProfileViewController, добавьте его в качестве subview и в методе viewWillLayoutSubviews() задайте ему frame, равный frame корневого view.

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        print("-> [viewWillLayoutSubviews] - it worked.")
    }
}
