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
        view.backgroundColor = UIColor(red: 0.34, green: 0.40, blue: 0.49, alpha: 0.1)
        
        // Cоздание кнопки "Переход к посту". Кнопку расположил на iPhone 11.
        let button = UIButton(type: .custom) as UIButton
        button.backgroundColor = UIColor(red: 0.57, green: 0.62, blue: 0.70, alpha: 0.1)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: CGFloat(253.0 / 255.0), green: CGFloat(112.0 / 255.0), blue: CGFloat(20.0 / 255.0), alpha: CGFloat(1.0)).cgColor
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
