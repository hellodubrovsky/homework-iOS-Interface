//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья on 14.12.2021.
//

// MARK: 6. Перейдите в файл ProfileHeaderView и, следуя макету, добавьте необходимые UI-элементы в качестве подпредставлений и установите для них нужные параметры.
// MARK: Ваш экран Profile должен в точности повторять макет. Уделите особое внимание отступам и шрифтам. Имя, подпись и аватарку можно выбрать по своему усмотрению :)

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        createUserName()
        createUserDescription()
        createUserImage()
        createButtonShowStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Private object's
    
    private let userName = UILabel()
    private let userDescription = UILabel()
    private let userImage = UIView()
    private let buttonShowStatus = UIButton(type: .custom) as UIButton
    
    
    
    // MARK: - Private method's
    
    private func createUserName() {
        userName.text = "userName"
        userName.frame = CGRect(x: 16, y: 100, width: 376, height: 50)
        self.addSubview(userName)
        print("-> [userName] - it worked.")
    }
    
    private func createUserDescription() {
        userDescription.text = "Waiting for something..."
        userDescription.frame = CGRect(x: 16, y: 200, width: 376, height: 50)
        self.addSubview(userDescription)
        print("-> [userDescription] - it worked.")
    }
    
    private func createUserImage() {
        userImage.layer.contents = UIImage(named: "cat")?.cgImage
        userImage.layer.contentsGravity = .resizeAspect
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.systemYellow.cgColor
        userImage.layer.borderWidth = 2
        userImage.backgroundColor = .systemGreen
        userImage.layer.cornerRadius = 50
        userImage.clipsToBounds = true
        userImage.frame = CGRect(x: 16, y: 300, width: 100, height: 100)
        
        self.addSubview(userImage)
        print("-> [userImage] - it worked.")
    }
    
    private func createButtonShowStatus() {
        buttonShowStatus.setTitle("Show status", for: .normal)
        buttonShowStatus.layer.cornerRadius = 16
        buttonShowStatus.backgroundColor = .systemBlue
        buttonShowStatus.frame = CGRect(x: 16, y: 500, width: 376, height: 50)
        buttonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonShowStatus.layer.shadowRadius = 4
        buttonShowStatus.layer.shadowOpacity = 0.7
        buttonShowStatus.layer.shadowColor = UIColor(ciColor: .black).cgColor
        
        self.addSubview(buttonShowStatus)
        print("-> [buttonShow] - it worked.")
    }
}
