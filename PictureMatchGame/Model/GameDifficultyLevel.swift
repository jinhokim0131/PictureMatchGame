import Foundation

enum GameDifficultyLevel: String, CaseIterable {
    case easy, medium, hard
    
    var nameKey: String {
        return "menu.level." + self.rawValue
    }
    
    var boardSize: (row: Int, column: Int) {
        switch self {
        case .easy:
            return (4, 4)
        case .medium:
            return (6, 4)
        case .hard:
            return (6, 5)
        }
    }
}
