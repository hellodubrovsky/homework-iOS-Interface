//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Илья on 24.01.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(photosCollectionView)
        addLayoutConstraint()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Photos"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let arrowButton: UIButton = {
        var button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let examplePhoto: UIImageView = {
        var image = UIImage(named: "photoProfile-12")!
        var imageView = UIImageView.init(image: image)
        imageView.layer.cornerRadius = 6.0
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let photosCollectionView: UICollectionView = {
        var viewLayout = UICollectionViewFlowLayout()
        var collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .red
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Private method's
    private func addLayoutConstraint() {
        NSLayoutConstraint.activate([
            //contentView.heightAnchor.constraint(equalToConstant: 150.0), // TODO: После тестов убрать!
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            arrowButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosCollectionView.heightAnchor.constraint(equalToConstant: 80) // TODO: После тестов убрать!
        ])
    }
}
