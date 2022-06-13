//
//  Game.swift
//  Bullseye
//
//  Created by Beto Toro on 3/05/22.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
 
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 800, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 55, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    var finalScore: Int
    let difference = abs(sliderValue - target)
    if sliderValue == target {
      finalScore = 200
    } else if difference <= 2 {
      finalScore = (100 - difference) + 50
    } else {
      finalScore = 100 - difference
    }
    return finalScore 
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    
    addToLeaderboard(entry: LeaderboardEntry(score: points, date:  Date()))
  }
  
  mutating func restart() {
    round = 1
    score = 0
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(entry: LeaderboardEntry) {
    leaderboardEntries.append(entry)
    leaderboardEntries.sort { $0.score > $1.score }
  }
}
