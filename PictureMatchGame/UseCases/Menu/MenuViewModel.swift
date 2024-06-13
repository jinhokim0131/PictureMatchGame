import Foundation

final class MainMenuViewModel {

    let titleTextKey = "app.name"
    let subtitleTextKey = "menu.level.title"

    func randomImageId() -> String {
        return "card-\(Int.random(in: 1...15))"
    }
    
}
