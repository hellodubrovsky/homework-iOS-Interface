//
//  CellModel.swift
//  TestingCollectionView
//
//  Created by Илья on 04.02.2022.
//

import Foundation
import UIKit

struct CellData {
    let title: String
    let subtitle: String
    let counter: Int
    let statusImage: UIImage
    let color: UIColor
}

let dataCell: [CellData] = [CellData(title: "1. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "circle")! , color: .systemBlue),
                            CellData(title: "2. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .purple),
                            CellData(title: "3. Длинный заголовок, который не умещается в ячейке", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .red),
                            CellData(title: "4. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "circle")! , color: .systemCyan),
                            CellData(title: "5. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .black),
                            CellData(title: "6. Длинный заголовок, который не умещается в ячейке", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .systemBrown),
                            CellData(title: "7. Короткий заголовок", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "circle")! , color: .orange),
                            CellData(title: "8. Средний заголовок по длине строки", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .systemMint),
                            CellData(title: "9. Длинный заголовок, который не умещается в ячейке", subtitle: "Example subtitle", counter: 0, statusImage: UIImage(systemName: "checkmark.circle.fill")! , color: .red)
]
