//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Beto Toro on 16/05/22.
//

import SwiftUI

struct LeaderboardView: View {
  
  @Binding var leaderboardIsShowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) { i in let leaderboardEntry = game.leaderboardEntries[i]
              RowView(index: i, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct RowView: View {
  
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack{
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.LeaderBoardScoreColWidth)
      Spacer()
      DateText(date: Date())
        .frame(width: Constants.Leaderboard.LeaderBoardDateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.LeaderBoardMaxRowWidth)
  }
}

struct HeaderView: View {
  
  @Binding var leaderboardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact
        {
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      }
      .padding(.top)
      HStack {
        Spacer()
        Button(action: {
          leaderboardIsShowing = false
        }) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      GameLabelText(text: "Score")
        .frame(width: Constants.Leaderboard.LeaderBoardScoreColWidth)
      Spacer()
      GameLabelText(text: "Date")
        .frame(width: Constants.Leaderboard.LeaderBoardDateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.LeaderBoardMaxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .previewLayout(.fixed(width: 568, height: 320))
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
  }
}
