//
//  FeedViewController.swift
//  Navigation
//
//  Created by Илья on 27.11.2021.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // Cоздание кнопки "Переход к посту". Кнопку расположил на iPhone 11.
        let button = UIButton(type: .custom) as UIButton
        button.backgroundColor = .systemGray
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("Переход к посту", for: .normal)
        button.frame = CGRect(x: 100, y: 420, width: 200, height: 50)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // Реализация открытия окна "Info" по нажатию кнопки.
    @objc func buttonAction(sender: UIButton!) {
        let postViewController = PostViewController()
        let titlePost: Post = Post(title: "Post")
        postViewController.title = titlePost.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}
