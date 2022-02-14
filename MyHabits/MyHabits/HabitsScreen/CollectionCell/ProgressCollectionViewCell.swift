import UIKit

final class ProgressCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Private objects
    
    private let titleProgressCellLabel: UILabel = {
        let label = UILabel()
        label.text = "Всё получится!"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textPercentageOfProgressLabel: UILabel = {
        let label = UILabel()
        label.text = String(Int(self.progressBarView.progress * 100)) + "%"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var progressBarView: UIProgressView = {
        let progress = UIProgressView()
        progress.progress = 0.50
        progress.trackTintColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
        progress.progressTintColor = UIColor(named: "purpleColorApp")
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    
    
    // MARK: Private methods
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.addSubview(titleProgressCellLabel)
        contentView.addSubview(textPercentageOfProgressLabel)
        contentView.addSubview(progressBarView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleProgressCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleProgressCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            textPercentageOfProgressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textPercentageOfProgressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressBarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 38),
            progressBarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressBarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            progressBarView.heightAnchor.constraint(equalToConstant: 7),
        ])
    }
}



// MARK: - Protocol reusable

extension ProgressCollectionViewCell: ReusableCell {
    static var identifier: String { String(describing: self) }
}
