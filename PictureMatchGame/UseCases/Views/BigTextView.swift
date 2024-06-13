import SwiftUI

struct BigTextView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .foregroundColor(.accentColor)
            .font(.system(size: 100))
            .bold()
            .minimumScaleFactor(0.01)
    }
}

struct BigTextView_Previews: PreviewProvider {
    static var previews: some View {
        BigTextView(key: "Text")
    }
}
