import UIKit

protocol ReusableViewHeader: AnyObject {
    static var identifier: String { get }
}

class HeaderCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubview(titleHabits)
        contentView.addSubview(percentageOfCompletion)
        contentView.addSubview(progressBarLabel)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var titleHabits: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.text = "Всё получится!"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var percentageOfCompletion: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        label.text = "50%"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var progressBarLabel: UIProgressView = {
        var view = UIProgressView()
        view.trackTintColor = UIColor(red: 0.557, green: 0.557, blue: 0.576, alpha: 1)
        view.progressTintColor = UIColor(red: 0.631, green: 0.086, blue: 0.8, alpha: 1)
        view.progress = 0.5
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            percentageOfCompletion.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            percentageOfCompletion.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressBarLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 38),
            progressBarLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressBarLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressBarLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            progressBarLabel.heightAnchor.constraint(equalToConstant: 7),
        ])
    }
}

extension HeaderCollectionViewCell: ReusableViewHeader {
    static var identifier: String { String(describing: self) }
}
