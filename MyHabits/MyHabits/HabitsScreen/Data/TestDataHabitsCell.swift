import UIKit

struct CellData {
    let title: String
    let subtitle: String
    let counter: Int
    let statusImage: Bool
    let color: UIColor
}

var dataCell: [CellData] = [CellData(title: "1. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: false , color: .systemBlue),
                            CellData(title: "2. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 2, statusImage: false , color: .purple),
                            CellData(title: "3. Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 3, statusImage: true , color: .red),
                            CellData(title: "1. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: false , color: .systemBlue),
                            CellData(title: "2. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 2, statusImage: false , color: .purple),
                            CellData(title: "3. Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 3, statusImage: true , color: .red),
                            CellData(title: "1. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: false , color: .systemBlue),
                            CellData(title: "2. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 2, statusImage: false , color: .purple),
                            CellData(title: "3. Очень длинный заголовок, который не умещается в ячейке, потому что большой", subtitle: "Example subtitle", counter: 3, statusImage: true , color: .red),
]

