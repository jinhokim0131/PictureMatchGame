import SwiftUI

struct GameSubtitleView: View {
    
    let key: LocalizedStringKey
    
    var body: some View {
        Text(key)
            .font(.title3)
            .foregroundColor(.accentColor)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GameSubtitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameSubtitleView(key: "Subtitle")
    }
}
