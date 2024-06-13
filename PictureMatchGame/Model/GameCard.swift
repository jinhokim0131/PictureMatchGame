import Foundation

class GameCard: ObservableObject {
    
    let uuid = UUID().uuidString
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    @Published var flipped = false
    @Published var matched = false
}
