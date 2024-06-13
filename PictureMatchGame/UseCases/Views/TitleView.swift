import SwiftUI

struct GameTitleView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .font(.largeTitle)
            .foregroundColor(.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .textCase(.uppercase)
    }
}

struct GameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameTitleView(key: "Title")
    }
}
