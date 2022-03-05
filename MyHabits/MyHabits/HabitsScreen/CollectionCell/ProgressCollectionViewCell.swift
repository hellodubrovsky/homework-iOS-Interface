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
    
    /// Отсутупы для элементов.
    private enum LayoutConstants {
        static let topForTitle = 10.0
        static let topForProgress = 38.0
        static let bottomForProgress = -15.0
        static let heightProgress = 7.0
        static let tralling = -12.0
        static let leading = 12.0
    }
    
    
    
    
    // MARK: Public method (update progress)
    
    public func updateProgress() {
        progressBarView.setProgress(HabitsStore.shared.todayProgress, animated: true)
        textPercentageOfProgressLabel.text = String(Int(self.progressBarView.progress * 100)) + "%"
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
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.layer.cornerRadius = 5
        progress.clipsToBounds = true
        progress.setProgress(HabitsStore.shared.todayProgress, animated: false)
        progress.trackTintColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
        progress.progressTintColor = UIColor(named: "purpleColorApp")
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    
    
    
    
    // MARK: SET VIEW
    
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
            titleProgressCellLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.topForTitle),
            titleProgressCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            textPercentageOfProgressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.topForTitle),
            textPercentageOfProgressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.tralling),
            progressBarView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: LayoutConstants.topForProgress),
            progressBarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            progressBarView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.tralling),
            progressBarView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: LayoutConstants.bottomForProgress),
            progressBarView.heightAnchor.constraint(equalToConstant: LayoutConstants.heightProgress),
        ])
    }
}





// MARK: - Protocol reusable

extension ProgressCollectionViewCell: ReusableCell {
    static var identifier: String { String(describing: self) }
}
