struct GlobalConstants {
    
    /// Определение экрана (сохраненения или изменения привычки)
    enum TypeScreenHabit {
        case add
        case edit
    }
    
    static let progressCellNotificationKey = "hellodubrovsky.progress"
    static let cellsReloadedNotificationKey = "hellodubrovsky.habit.cell"
}
