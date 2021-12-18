//
//  InfoViewController.swift
//  Navigation
//
//  Created by Илья on 28.11.2021.
//

import UIKit

class InfoViewController: UIViewController {
    
    //  9. На InfoViewController создайте кнопку. При нажатии на неё должен показаться UIAlertController с заданным title, message и двумя UIAlertAction.
    //  При нажатии на UIAlertAction в консоль должно выводиться сообщение..

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        self.title = "Info"
        
        // Cоздание кнопки "Показать алерт". Кнопку расположил на iPhone 11.
        let buttonAlert = UIButton(type: .custom) as UIButton
        buttonAlert.backgroundColor = .gray
        buttonAlert.layer.borderColor = UIColor.white.cgColor
        buttonAlert.layer.borderWidth = 2
        buttonAlert.layer.cornerRadius = 15
        buttonAlert.setTitle("Показать алерт", for: .normal)
        buttonAlert.frame = CGRect(x: 100, y: 420, width: 200, height: 50)
        buttonAlert.addTarget(self, action: #selector(buttonAlertAction), for: .touchUpInside)
        view.addSubview(buttonAlert)
    }
    
    // Показ алерта при нажатии на кнопку "Показать алерт".
    @objc func buttonAlertAction(sender: UIButton) {
        let buttonClickOK = { (_: UIAlertAction) -> Void in print("Нажата кнопка 'ОК'.") }
        let buttonClickCancel = { (_: UIAlertAction) -> Void in print("Нажата кнопка 'Назад'.") }
        
        let alert = UIAlertController(title: "Заголовок", message: "Текст алерта.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: buttonClickOK))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: buttonClickCancel))
        self.present(alert, animated: true, completion: nil)
    }
}
