import UIKit

final class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.collectionView.reloadData()
    }
    
    
    
    // MARK: Private objects
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.969, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var addingHabitButton: UIBarButtonItem = {
        let largeFont = UIFont.systemFont(ofSize: 23)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let image = UIImage(systemName: "plus", withConfiguration: configuration)
        let item = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(showTheWindowForAddingNewHabit))
        item.tintColor = UIColor(named: "purpleColorApp")
        return item
    }()
    
    
    
    // MARK: Private methods
                             
    @objc private func showTheWindowForAddingNewHabit() {
        print("Pressed plus bar item")
        let addingHabitViewController = HabitViewController()
        addingHabitViewController.title = "Создать"
        
        self.navigationController?.pushViewController(addingHabitViewController, animated: true)
    }
    
    private func setupView() {
        title = "Сегодня"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = addingHabitButton
        view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: ProgressCollectionViewCell.identifier)
        collectionView.register(HabitsCollectionViewCell.self, forCellWithReuseIdentifier: HabitsCollectionViewCell.identifier)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            collectionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
}



// MARK: - CollectionView -> DataSource

extension HabitsViewController: UICollectionViewDataSource {
    
    // Количество секций
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // Количество ячеек в секциях
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard section == 0 else { return HabitsStore.shared.habits.count }
        return 1
    }
    
    // Заполнение ячеек данными
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: ProgressCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgressCollectionViewCell.identifier, for: indexPath) as? ProgressCollectionViewCell else { fatalError() }
            return cell
        default:
            guard let cell: HabitsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: HabitsCollectionViewCell.identifier, for: indexPath) as? HabitsCollectionViewCell else { fatalError() }
            let store = HabitsStore.shared.habits[indexPath.row]
            cell.update(title: store.name, subtitle: store.dateString, counter: 0, statusImage: store.isAlreadyTakenToday, color: store.color)
            return cell
        }
    }
}



// MARK: - CollectionView -> Delegate

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
    
    // Определение размеров ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.width - 32, height: 60)
        default:
            return CGSize(width: view.frame.width - 32, height: 130)
        }
    }
    
    // Расстоновка отсутпов между ячейками.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    // Обработка нажатий на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section == 1 else { return }
        let detail = HabitDetailsViewController()
        detail.title = dataCell[indexPath.row].title
        detail.indexElement = indexPath.row
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
