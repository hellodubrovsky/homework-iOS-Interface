import UIKit

struct CellData {
    let title: String
    let subtitle: String
    let counter: Int
    let statusImage: UIImage
    let color: UIColor
}

var dataCell: [CellData] = [CellData(title: "1. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "circle")! , color: .systemBlue),
                            CellData(title: "2. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 2, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .purple),
                            CellData(title: "3. Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 3, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .red),
                            CellData(title: "4. Короткий заголовок", subtitle: "Example subtitle", counter: 4, statusImage: UIImage(systemName: "circle")! , color: .systemRed),
                            CellData(title: "5. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 55, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .black),
                            CellData(title: "6.  Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 123, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .systemBrown),
                            CellData(title: "7. Короткий заголовок", subtitle: "Example subtitle", counter: 4331, statusImage: UIImage(systemName: "circle")! , color: .orange),
                            CellData(title: "8. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 1231231, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .systemRed),
                            CellData(title: "9.  Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 2, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .red)
]
