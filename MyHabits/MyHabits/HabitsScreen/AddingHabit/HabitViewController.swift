import UIKit

final class HabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    

    // MARK: Public objects
    // TRUE -> редактирование, FALSE -> добавление.
    public var typeHabbit: Bool = false
    

    
    // MARK: Private objects
    // Bar button items
    
    private lazy var cancelHabitButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(returnToThePreviousScreen))
        return item
    }()
    
    private lazy var saveHabitButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(keepinTheHabit))
        return item
    }()
    
    
    // Static objects
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let titleNameHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "НАЗВАНИЕ"
        label.font = .boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleColorHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "ЦВЕТ"
        label.font = .boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleTimeHabitLabel: UILabel = {
        let label = UILabel()
        label.text = "ВРЕМЯ"
        label.font = .boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // Action objects
    
    public let titleHabitTextField: UITextField = {
        let titleHabit = UITextField()
        titleHabit.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 22))
        titleHabit.font = .boldSystemFont(ofSize: 17)
        titleHabit.textColor = UIColor.init(named: "blueColorApp")
        titleHabit.attributedPlaceholder = NSAttributedString.init(string: "Бегать по утрам, спать 8 часов и т.п.")
        titleHabit.translatesAutoresizingMaskIntoConstraints = false
        return titleHabit
    }()
    
    private lazy var colorSettingButton: UIButton = {
        let button = UIButton()
        
        // TODO: Необходимо получать цвет из data.
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentColorPicker), for: .touchUpInside)
        return button
    }()
    
    private lazy var timeHabitLabel: UILabel = {
        let label = UILabel()
        label.attributedText = settingTimeString()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let habbitDatePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(editDatePicker), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    private let deleteHabitButton: UIButton = {
        var button = UIButton()
        button.titleLabel?.textColor = UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1)
        button.setTitle("Удалить привычку", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(deleteHabbit), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    
    // MARK: Private methods
    
    @objc private func returnToThePreviousScreen() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func keepinTheHabit() {
        guard !titleHabitTextField.text!.isEmpty else { return }
        
        // TODO: Тут должно происсходить сохранение данных
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        
        // TODO: Убрать проверку, после того, как будет реализован подбор цвета из date.
        colorPicker.selectedColor = self.colorSettingButton.backgroundColor ?? .blue
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    @objc private func editDatePicker() {
        timeHabitLabel.attributedText = settingTimeString()
    }
    
    @objc private func deleteHabbit() {
        let buttonClickOK = { (_: UIAlertAction) -> Void in
            
            // TODO: Тут должно происходить удаление привычки
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
        }
        
        let alert = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку 'название выбранной привычки'?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Удалить", style: .default, handler: buttonClickOK))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func settingTimeString() -> NSMutableAttributedString {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.black]
        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18), NSAttributedString.Key.foregroundColor : UIColor.blue]
        let attributedString1 = NSMutableAttributedString(string:"Каждый день в ", attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string: formatter.string(from: habbitDatePicker.date), attributes:attrs2)
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
    private func setupView() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = UIColor(named: "purpleColorApp")
        self.navigationItem.leftBarButtonItem = cancelHabitButton
        self.navigationItem.rightBarButtonItem = saveHabitButton
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleNameHabitLabel)
        contentView.addSubview(titleColorHabitLabel)
        contentView.addSubview(titleTimeHabitLabel)
        contentView.addSubview(titleHabitTextField)
        contentView.addSubview(colorSettingButton)
        contentView.addSubview(timeHabitLabel)
        contentView.addSubview(habbitDatePicker)
        
        // Если привычку редактируем, тогда добавляем кнопку удаления.
        guard typeHabbit else { return }
        contentView.addSubview(deleteHabitButton)
        deleteHabitButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -18).isActive = true
        deleteHabitButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            
            titleNameHabitLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 21),
            titleNameHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            titleHabitTextField.topAnchor.constraint(equalTo: titleNameHabitLabel.bottomAnchor, constant: 7),
            titleHabitTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleHabitTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            titleHabitTextField.heightAnchor.constraint(equalToConstant: 22),
            
            titleColorHabitLabel.topAnchor.constraint(equalTo: titleHabitTextField.bottomAnchor, constant: 15),
            titleColorHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            colorSettingButton.topAnchor.constraint(equalTo: titleColorHabitLabel.bottomAnchor, constant: 7),
            colorSettingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            colorSettingButton.widthAnchor.constraint(equalToConstant: 30),
            colorSettingButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleTimeHabitLabel.topAnchor.constraint(equalTo: colorSettingButton.bottomAnchor, constant: 15),
            titleTimeHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeHabitLabel.topAnchor.constraint(equalTo: titleTimeHabitLabel.bottomAnchor, constant: 7),
            timeHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            habbitDatePicker.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: 15),
            habbitDatePicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            habbitDatePicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}





// MARK: - Extension for colorPicker

extension HabitViewController: UIColorPickerViewControllerDelegate {

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        self.colorSettingButton.backgroundColor = viewController.selectedColor
    }

    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.colorSettingButton.backgroundColor = viewController.selectedColor
    }
}
