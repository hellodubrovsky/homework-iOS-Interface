import UIKit

class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Сегодня"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = addingHabitButton
    }
    
    
    
    // MARK: Private objects
    
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
    }
}
