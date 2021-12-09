//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Илья on 19.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UINib(nibName: "ProfileView", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        view.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
        self.view.addSubview(view)
    }
}
