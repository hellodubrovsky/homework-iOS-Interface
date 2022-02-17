import UIKit

final class HabitDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLauout()
        setupObserver()
    }
    
    
    
    
    
    // MARK: Getting data
    
    init(habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    // MARK: Private objects
    
    private var habit: Habit?
    private let identifierTable = String(describing: self)
    private let testData: [String] = ["Сегодня", "Вчера", "Позачера", "01 февраля 2022"]
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var addingHabitButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Править", style: .done, target: self, action: #selector(changingHabits))
        return item
    }()
    
    
    
    // MARK: Private methods
    
    private func setupView() {
        self.title = habit!.name
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = UIColor(named: "purpleColorApp")
        self.navigationItem.rightBarButtonItem = addingHabitButton
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifierTable)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func setupLauout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc private func changingHabits() {
        let navigationController = UINavigationController()
        let changingHabitView = HabitViewController(habit: self.habit!, typeHabit: .edit)
        changingHabitView.title = "Править"
        navigationController.setViewControllers([changingHabitView], animated: false)
        present(navigationController, animated: true)
    }
    
    
    
    
    
    // MARK: Obesrvers
    
    private func setupObserver() {
        let nameNotification = Notification.Name(rawValue: GlobalConstants.hideScreenDetailNotificationKey)
        NotificationCenter.default.addObserver(self, selector: #selector(hideDetailScreen), name: nameNotification, object: nil)
    }
    
    @objc private func hideDetailScreen() {
        navigationController?.popViewController(animated: true)
    }
}



// MARK: - HabitDetailsViewController -> DataSource

extension HabitDetailsViewController: UITableViewDataSource {
    
    // Количество ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    // Заполнение ячеек данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: identifierTable) else { fatalError() }
        
        // TODO: В ячейку нужно класть даты, в которых привычка была выполнена.
        let date = HabitsStore.shared.dates[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM yyyy"
        
        cell.textLabel?.text = dateFormatter.string(from: date)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17)
        cell.selectionStyle = .none
        
        if HabitsStore.shared.habit(habit!, isTrackedIn: date) {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    // Заголовок для header'a
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "АКТИВНОСТЬ"
    }
}



// MARK: - HabitDetailsViewController -> Delegate

extension HabitDetailsViewController: UITableViewDelegate {
    
    // Определения размера шрифта для header'a
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.frame.size.width = tableView.frame.size.width
        header.textLabel?.font = UIFont.systemFont(ofSize: 13)
        header.textLabel?.textColor = UIColor(red: 0.235, green: 0.235, blue: 0.263, alpha: 0.6)
    }
}
