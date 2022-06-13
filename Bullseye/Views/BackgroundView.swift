//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Beto Toro on 9/05/22.
//

import SwiftUI

struct BackgroundView: View {

  @Binding var game: Game

  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct TopView: View {

  @Binding var game: Game
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }) {
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leaderboardIsShowing = true
      }) {
        RoundedImageViewFilled(systemName: "list.dash")
      }.sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      })
    }
  }
}

struct BottomView: View {

  @Binding var game: Game

  var body: some View {
    HStack {
      NumberView(title: "SCORE", text: String(game.score))
      Spacer()
      NumberView(title: "ROUND", text: String(game.round))
    }
  }
}


struct NumberView: View {
  
  var title: String
  var text: String
  
  var body: some View {
    VStack(spacing: 5) {
      GameLabelText(text: title)
      RoundRectTextView(text: text)
    }
  }
  
}

struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      ForEach(1..<6) { ring in let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("RadialColor").opacity(opacity), Color("RadialColor").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size )
      }
      
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
