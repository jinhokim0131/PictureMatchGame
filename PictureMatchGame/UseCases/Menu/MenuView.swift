
import SwiftUI

struct MainMenuView: View {
    
    private var viewModel = MainMenuViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .medium) {
                
                GameTitleView(key: viewModel.titleTextKey.key())

                Image(viewModel.randomImageId())
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                
                Spacer()
                
                GameSubtitleView(key: viewModel.subtitleTextKey.key())
                
                ForEach(GameDifficultyLevel.allCases, id: \.self) { difficultyLevel in
                    NavigationLink(destination: GameBoardView(difficultyLevel: difficultyLevel), label: {
                        MenuButtonView(key: difficultyLevel.nameKey.key())
                    })
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
        MainMenuView().preferredColorScheme(.dark)
    }
}
