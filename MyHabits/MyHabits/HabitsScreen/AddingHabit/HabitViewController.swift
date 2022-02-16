import UIKit

final class HabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    /// Отсутупы для элементов.
    private enum LayoutConstants {
        static let leading = 15.0
        static let tralling = -15.0
        static let topForTitle = 15.0
        static let topForTitleName = 21.0
        static let topActionItem = 7.0
        static let topDatePicker = 15.0
        static let heightTextFiled = 22.0
        static let widthAndHeightColorButton = 30.0
    }
    
    
    
    
    
    // MARK: Getting data
    
    init(habit: Habit?, typeHabit: GlobalConstants.TypeScreenHabit) {
        self.habit = habit
        self.typeHabit = typeHabit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var habit: Habit?
    private var typeHabit: GlobalConstants.TypeScreenHabit
    
    
    
    
    
    // MARK: Private objects
    /// Bar button items
    
    private lazy var cancelHabitButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Отменить", style: .plain, target: self, action: #selector(returnToThePreviousScreen))
        return item
    }()
    
    private lazy var saveHabitButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(keepinTheHabit))
        return item
    }()
    
    
    
    /// Static objects
    
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
    
    
    
    /// Action objects
    
    public lazy var titleHabitTextField: UITextField = {
        let titleHabit = UITextField()
        titleHabit.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 22))
        titleHabit.font = .boldSystemFont(ofSize: 17)
        titleHabit.textColor = UIColor.init(named: "blueColorApp")
        titleHabit.attributedPlaceholder = NSAttributedString.init(string: "Бегать по утрам, спать 8 часов и т.п.")
        titleHabit.translatesAutoresizingMaskIntoConstraints = false
        guard typeHabit == .edit else { return titleHabit }
        titleHabit.text = self.habit?.name
        return titleHabit
    }()
    
    private lazy var colorSettingButton: UIButton = {
        let button = UIButton()
        let store = HabitsStore.shared
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentColorPicker), for: .touchUpInside)
        button.backgroundColor = typeHabit == .edit ? self.habit?.color : self.habit?.color ?? .orange
        return button
    }()
    
    private lazy var timeHabitLabel: UILabel = {
        let label = UILabel()
        label.attributedText = settingTimeString()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var habbitDatePicker: UIDatePicker = {
        var datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(editDatePicker), for: .valueChanged)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        guard typeHabit == .edit else { return datePicker }
        datePicker.date = self.habit!.date
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
    
    /// Нажатие кнопки "Отмена"
    @objc private func returnToThePreviousScreen() {
        self.dismiss(animated: true)
    }
    
    /// Нажатие кнопки "Сохранить"
    @objc private func keepinTheHabit() {
        guard !titleHabitTextField.text!.isEmpty else { return }
        if typeHabit == .edit {
            // Изменение привычки
            let indexItem = HabitsStore.shared.habits.firstIndex(of: self.habit!)
            HabitsStore.shared.habits[indexItem!] = .init(name: titleHabitTextField.text!, date: habbitDatePicker.date, color: colorSettingButton.backgroundColor!)
            self.habit = .init(name: titleHabitTextField.text!, date: habbitDatePicker.date, color: colorSettingButton.backgroundColor!)
            
            // TODO: ТУТ НУЖНО ПОНЯТЬ, КАК ПЕРЕДАВАТЬ В DETAIL НОВЫЕ ДАННЫЕ, В ТОМ ЧИСЛЕ И ЗАГОЛОВОК
            
        } else {
            // Сохранение привычки
            let newHabit = Habit(name: titleHabitTextField.text!, date: habbitDatePicker.date, color: colorSettingButton.backgroundColor!)
            let store = HabitsStore.shared
            store.habits.append(newHabit)
            let nameNotification = Notification.Name(rawValue: GlobalConstants.progressCellNotificationKey)
            NotificationCenter.default.post(name: nameNotification, object: nil)
            
        }
        let nameReloadCellsNotification = Notification.Name(rawValue: GlobalConstants.cellsReloadedNotificationKey)
        NotificationCenter.default.post(name: nameReloadCellsNotification, object: nil)
        self.dismiss(animated: true)
    }
    
    /// Нажатие кнопки изменение цвета
    @objc private func presentColorPicker() {
        let colorPicker = UIColorPickerViewController()
        colorPicker.selectedColor = self.colorSettingButton.backgroundColor!
        colorPicker.delegate = self
        self.present(colorPicker, animated: true, completion: nil)
    }
    
    /// Изменение времени в DatePicker
    @objc private func editDatePicker() {
        timeHabitLabel.attributedText = settingTimeString()
    }
    
    /// Обработка изменения времени в DatePicker
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
    
    /// Нажатие кнопки "Удалить привычку"
    @objc private func deleteHabbit() {
        let buttonClickOK = { (_: UIAlertAction) -> Void in
            let indexItem = HabitsStore.shared.habits.firstIndex(of: self.habit!)
            HabitsStore.shared.habits.remove(at: indexItem!)
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.popViewController(animated: true)
            let nameNotification = Notification.Name(rawValue: GlobalConstants.progressCellNotificationKey)
            NotificationCenter.default.post(name: nameNotification, object: nil)
        }
        let alert = UIAlertController(title: "Удалить привычку", message: "Вы хотите удалить привычку\n'\(self.habit!.name)'?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Удалить", style: .default, handler: buttonClickOK))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    // MARK: SET VIEW.
    
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
        guard typeHabit == .edit else { return }
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
            
            titleNameHabitLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.topForTitleName),
            titleNameHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            
            titleColorHabitLabel.topAnchor.constraint(equalTo: titleHabitTextField.bottomAnchor, constant: LayoutConstants.topForTitle),
            titleColorHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            
            titleTimeHabitLabel.topAnchor.constraint(equalTo: colorSettingButton.bottomAnchor, constant: LayoutConstants.topForTitle),
            titleTimeHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            
            titleHabitTextField.topAnchor.constraint(equalTo: titleNameHabitLabel.bottomAnchor, constant: LayoutConstants.topActionItem),
            titleHabitTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            titleHabitTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: LayoutConstants.tralling),
            titleHabitTextField.heightAnchor.constraint(equalToConstant: LayoutConstants.heightTextFiled),
            
            colorSettingButton.topAnchor.constraint(equalTo: titleColorHabitLabel.bottomAnchor, constant: LayoutConstants.topActionItem),
            colorSettingButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            colorSettingButton.widthAnchor.constraint(equalToConstant: LayoutConstants.widthAndHeightColorButton),
            colorSettingButton.heightAnchor.constraint(equalToConstant: LayoutConstants.widthAndHeightColorButton),
            
            timeHabitLabel.topAnchor.constraint(equalTo: titleTimeHabitLabel.bottomAnchor, constant: LayoutConstants.topActionItem),
            timeHabitLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: LayoutConstants.leading),
            
            habbitDatePicker.topAnchor.constraint(equalTo: timeHabitLabel.bottomAnchor, constant: LayoutConstants.topActionItem),
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
