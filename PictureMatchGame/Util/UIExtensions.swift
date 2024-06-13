import SwiftUI

extension CGFloat {
    
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    
}

extension String {
    
    func key() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
