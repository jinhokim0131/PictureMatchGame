import SwiftUI

struct GameBoardView: View {
    
    let difficultyLevel: GameDifficultyLevel
    
    @ObservedObject private var viewModel = GameBoardViewModel()
    
    @Environment(\.presentationMode) private var presentation
    
    var body: some View {
        VStack {
            
            GameTitleView(key: difficultyLevel.nameKey.key())
            
            HStack {
                GameSubtitleView(key: viewModel.movementsTextKey.key())
                CounterView(count: viewModel.movements, large: false)
            }.padding(.top, .small)
            HStack {
                GameSubtitleView(key: viewModel.remainingTextKey.key())
                CounterView(count: viewModel.remaining, large: false)
            }
            
            Spacer()

            HStack {
                TimeBarView(value: viewModel.progress)
                CounterView(count: viewModel.seconds, large: true)
                    .frame(width: CGFloat(GameConfiguration.gameTime.description.count) * 20, alignment: .trailing)
            }

            if let cards = viewModel.cards {
                ZStack {
                    VStack(spacing: .small) {
                        ForEach(0..<difficultyLevel.boardSize.row, id: \.self) { row in
                            HStack(spacing: .small) {
                                ForEach(0..<difficultyLevel.boardSize.column, id: \.self) { column in
                                    let card = cards[row * difficultyLevel.boardSize.column + column]
                                    GameCardView(card: card, tap: {
                                        viewModel.checkCard(currentCard: card)
                                    })
                                    .allowsHitTesting(!viewModel.disabled)
                                }
                            }
                        }
                    }.opacity(viewModel.checkGameText() != nil ? 0.5 : 1)
                    
                    if let text = viewModel.checkGameText() {
                        BigTextView(key: text.key())
                            .allowsHitTesting(false)
                    }
                }
            }
            
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                MenuButtonView(key: viewModel.levelsTextKey.key())
                    .padding(.top, .medium)
            }
        }
        .padding()
        .navigationBarHidden(true)
        .onAppear {
            viewModel.loadCards(difficultyLevel: difficultyLevel)
        }
        .onDisappear {
            viewModel.endGame()
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        GameBoardView(difficultyLevel: .hard)
        GameBoardView(difficultyLevel: .easy).preferredColorScheme(.dark)
    }
}
