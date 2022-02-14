import UIKit

final class HabitsCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: Public method
    
    func update(title: String, subtitle: String, counter: Int, statusImage: Bool, color: UIColor) {
        titleHabits.text = title
        titleHabits.textColor = color
        subtitleHabits.text = subtitle
        counterHabits.text = "Счётчик: \(counter)"
        statusHabitsButton.tintColor = color
        statusImage ? statusHabitsButton.setImage(UIImage(systemName: "checkmark.circle.fill")!, for: .normal) : statusHabitsButton.setImage(UIImage(systemName: "circle")!, for: .normal)
    }
    
    
    
    // MARK: Private objects
    
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
    
    private var statusHabitsButton: UIButton = {
        var button = UIButton(frame: .zero)
        button.addTarget(self, action: #selector(changeStatusHabit), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    // MARK: Private methods
    
    @objc private func changeStatusHabit() {
        
        if statusHabitsButton.currentImage == UIImage(systemName: "checkmark.circle.fill")! {
            
            // TODO: ТУТ НУЖНО ОТМЕЧАТЬ НЕВЫПОЛННЕЮ ПРИВЫЧКУ
            statusHabitsButton.setImage(UIImage(systemName: "circle")!, for: .normal)
        } else {
            
            // TODO: ТУТ НУЖНО ОТМЕЧАТЬ ВЫПОЛННЕЮ ПРИВЫЧКУ
            statusHabitsButton.setImage(UIImage(systemName: "checkmark.circle.fill")!, for: .normal)
        }
    }
    
    private func setupView() {
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.addSubview(titleHabits)
        contentView.addSubview(subtitleHabits)
        contentView.addSubview(counterHabits)
        contentView.addSubview(statusHabitsButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -75),
            subtitleHabits.topAnchor.constraint(equalTo: titleHabits.bottomAnchor, constant: 4),
            subtitleHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subtitleHabits.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -75),
            counterHabits.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 92),
            counterHabits.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            counterHabits.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            statusHabitsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 46),
            statusHabitsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            statusHabitsButton.widthAnchor.constraint(equalToConstant: 38),
            statusHabitsButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
}



// MARK: - Protocol reusable

extension HabitsCollectionViewCell: ReusableCell {
    static var identifier: String { String(describing: self) }
}
