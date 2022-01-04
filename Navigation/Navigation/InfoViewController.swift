//
//  InfoViewController.swift
//  Navigation
//
//  Created by Илья on 28.11.2021.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.61, green: 0, blue: 0, alpha: 1)
        self.title = "Info"
        
        // Cоздание кнопки "Показать алерт". Кнопку расположил на iPhone 11.
        let buttonAlert = UIButton(type: .custom) as UIButton
        buttonAlert.backgroundColor = UIColor(red: 0.57, green: 0.62, blue: 0.70, alpha: 0.5)
        buttonAlert.layer.borderColor = UIColor(red: CGFloat(253.0 / 255.0), green: CGFloat(112.0 / 255.0), blue: CGFloat(20.0 / 255.0), alpha: CGFloat(1.0)).cgColor
        buttonAlert.layer.borderWidth = 2
        buttonAlert.layer.cornerRadius = 25
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
