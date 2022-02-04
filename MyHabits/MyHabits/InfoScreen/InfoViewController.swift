import UIKit

final class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Информация"
        view.addSubview(scrollView)
        scrollView.addSubview(informationTextView)
        activateLayoutConstraints()
    }
    
    
    
    // MARK: Private objects
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var informationTextView: UITextView = {
        let textView = UITextView()
        textView.showsVerticalScrollIndicator = false
        textView.attributedText = attributed(text: InformationData.informationText)
        textView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    
    // MARK: Private methods
    
    private func activateLayoutConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            informationTextView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            informationTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            informationTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            informationTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            informationTextView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            informationTextView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    /* https://stackoverflow.com/questions/31647653/bold-part-of-string-in-uitextview-swift */
    private func attributed(text: String) -> NSAttributedString {
        let string = text as NSString
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0)])
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20.0)]
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Привычка за 21 день"))
        return attributedString
    }
}
