//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Илья on 27.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .lightGray
        view.addSubview(profileView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        print("-> [viewWillLayoutSubviews] - it worked.")
    }
}
