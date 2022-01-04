//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Илья on 14.12.2021.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(userName)
        self.addSubview(userDescription)
        self.addSubview(userImage)
        self.addSubview(buttonShowStatus)
        self.addSubview(statusTextField)
        addingLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Private object's
    private let userName: UILabel = {
        let name = UILabel()
        name.text = "Happy Robocat"
        name.font = .boldSystemFont(ofSize: 20)
        name.textColor = .black
        return name
    }()
    
    private let userDescription: UILabel = {
        let description = UILabel()
        description.text = "Waiting for something ..."
        description.font = .systemFont(ofSize: 14, weight: .regular)
        description.textColor = .gray
        return description
    }()
    
    private let userImage: UIView = {
        let image = UIView()
        image.layer.contents = UIImage(named: "cat")?.cgImage
        image.layer.contentsGravity = .resizeAspect
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 3
        image.backgroundColor = .systemGreen
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()
    
    private let buttonShowStatus: UIButton = {
        let button = UIButton(type: .custom) as UIButton
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor(ciColor: .black).cgColor
        button.addTarget(self, action: #selector(buttonShowStatusPressed), for: .touchUpInside)
        return button
    }()
    
    private let statusTextField: UITextField = {
        let status = UITextField()
        status.backgroundColor = .white
        status.font = .systemFont(ofSize: 15, weight: .regular)
        status.textColor = .black
        status.layer.cornerRadius = 12
        status.layer.borderWidth = 1
        status.layer.borderColor = UIColor(ciColor: .black).cgColor
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return status
    }()
    
    private var statusText: String = ""
    
    
    
    // MARK: - Private method's
    @objc private func buttonShowStatusPressed() {
        guard statusText != "" else { return }
        userDescription.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    private func addingLayoutConstraints() {
        userName.translatesAutoresizingMaskIntoConstraints = false
        userDescription.translatesAutoresizingMaskIntoConstraints = false
        userImage.translatesAutoresizingMaskIntoConstraints = false
        buttonShowStatus.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            userName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userDescription.topAnchor.constraint(equalTo: self.topAnchor, constant: 170),
            userDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 136),
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            buttonShowStatus.topAnchor.constraint(equalTo: self.topAnchor, constant: 245),
            buttonShowStatus.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttonShowStatus.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            buttonShowStatus.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 190),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 134),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
