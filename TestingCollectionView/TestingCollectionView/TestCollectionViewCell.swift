import UIKit

protocol ReusableView: AnyObject {
    static var identifier: String { get }
}

class TestCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.clipsToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.addSubview(titleHabits)
        contentView.addSubview(subtitleHabits)
        contentView.addSubview(counterHabits)
        contentView.addSubview(statusHabits)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var titleHabits: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var subtitleHabits: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var counterHabits: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statusHabits: UIImageView = {
        var status = UIImageView(frame: .zero)
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleHabits.widthAnchor.constraint(equalToConstant: 220),
            subtitleHabits.topAnchor.constraint(equalTo: titleHabits.bottomAnchor, constant: 4),
            subtitleHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            counterHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 92),
            counterHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            counterHabits.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            statusHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            statusHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            statusHabits.widthAnchor.constraint(equalToConstant: 38),
            statusHabits.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    func update(title: String, subtitle: String, counter: Int, statusImage: UIImage, color: UIColor) {
        titleHabits.text = title
        titleHabits.textColor = color
        subtitleHabits.text = subtitle
        counterHabits.text = "Counter: \(counter)"
        statusHabits.image = statusImage
        statusHabits.tintColor = color
    }
}





// MARK: - Unique ID for collectionView
extension TestCollectionViewCell: ReusableView {
    static var identifier: String { String(describing: self) }
}
