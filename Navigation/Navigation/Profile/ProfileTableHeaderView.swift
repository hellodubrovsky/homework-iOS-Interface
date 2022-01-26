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
    
    
    
    // MARK: Private object's
    
    private let userName: UILabel = {
        let name = UILabel()
        name.text = "Robocat"
        name.font = .boldSystemFont(ofSize: 20)
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let userDescription: UILabel = {
        let description = UILabel()
        description.text = "Waiting for something ..."
        description.font = .systemFont(ofSize: 14, weight: .regular)
        description.textColor = .white
        description.translatesAutoresizingMaskIntoConstraints = false
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let buttonShowStatus: UIButton = {
        let button = UIButton(type: .custom) as UIButton
        button.setTitle("Set status", for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor(ciColor: .black).cgColor
        button.addTarget(self, action: #selector(buttonShowStatusPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let statusTextField: UITextField = {
        let status = UITextField()
        status.attributedPlaceholder =  NSAttributedString(string: "Set your status..", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        status.backgroundColor = .white
        status.font = .systemFont(ofSize: 15, weight: .regular)
        status.textColor = .black
        status.layer.cornerRadius = 12
        status.layer.borderWidth = 1
        status.layer.borderColor = UIColor(ciColor: .black).cgColor
        status.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        status.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 20))
        status.leftViewMode = .always
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private var statusText: String = ""
    
    
    
    // MARK: Private method's
    
    @objc private func buttonShowStatusPressed() {
        guard statusText != "" else { return }
        userDescription.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
    
    private func addingLayoutConstraints() {
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            userName.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            userDescription.topAnchor.constraint(equalTo: userName.topAnchor, constant: 50),
            userDescription.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
            userDescription.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            userImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            userImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            userImage.heightAnchor.constraint(equalToConstant: 100),
            userImage.widthAnchor.constraint(equalToConstant: 100),
            
            buttonShowStatus.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            buttonShowStatus.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            buttonShowStatus.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -16),
            buttonShowStatus.heightAnchor.constraint(equalToConstant: 50),
            
            statusTextField.topAnchor.constraint(equalTo: userDescription.bottomAnchor, constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 14),
            statusTextField.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
