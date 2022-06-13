//
//  TextViews.swift
//  Bullseye
//
//  Created by Beto Toro on 6/05/22.
//

import SwiftUI

struct InstructionText: View {
  
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
  
}

struct LabelText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
      .font(.callout)
      .frame(width: 35.0)
  }
}

struct GameLabelText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColor"))
      .bold()
      .font(.caption)
      .kerning(1.5)
  }
}

struct BodyText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.subheadline)
      .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
      .lineSpacing(12.0)
      .multilineTextAlignment(.center)
  }
}

struct ButtonText: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(.white)
      .font(.headline)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .cornerRadius(12.0)
  }
}

struct ScoreText: View {
  
  var score: Int
  
  var body: some View {
    Text(String(score))
      .font(.title3)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
  }
}

struct DateText: View {
  
  var date: Date
  
  var body: some View {
    Text(date, style: .time)
      .font(.title3)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
  }
}


struct BigBoldText: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
      .font(.title)
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯 \nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
      BigNumberText(text: "999")
      LabelText(text: "1")
      GameLabelText(text: "score")
      BodyText(text: "You scored 200 Points \n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(score: 489)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
    }
    .padding()
  }
}
