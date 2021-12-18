//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Alex Ciobanu on 12/17/21.
//

import SwiftUI

let moves =          ["✊", "✋", "✌️"]
let winningChoices = ["✋", "✌️", "✊"]
let losingChoices =  ["✌️", "✊", "✋"]

struct ContentView: View {
    @State var computerChoice = moves.randomElement()!
    @State var shouldWin = Bool.random()
    @State var score = 0
    @State var rounds = 0
    @State var showingGameOVer = false
    
    var body: some View {
        VStack {
            Text("\(score) of 10")
            Text(computerChoice)
            Text(shouldWin ? "Win" : "Lose")
            HStack {
                ForEach(moves, id: \.self) { move in
                    Button(move) {
                        guard let indexOfComputerChoice = moves.firstIndex(where: { $0 == computerChoice }) else {
                            return
                        }
                        
                        if shouldWin && move == winningChoices[indexOfComputerChoice] {
                            //if hasWon(computer: computerChoice, user: move) { score += 1 }
                            score += 1
                        } else if !shouldWin && move == losingChoices[indexOfComputerChoice]{
                            //if hasLost(computer: computerChoice, user: move) { score += 1 }
                            score += 1
                        }
                        
                        rounds += 1
                        
                        if rounds == 10 {
                            showingGameOVer = true
                            return
                        }
                        computerChoice = moves.randomElement()!
                        shouldWin.toggle()
                    }
                }
            }
        }
        .font(.system(size: 70))
        .alert(isPresented: $showingGameOVer) {
            .init(title: Text("Game Over"), message: Text("Final Score: \(score) of 10"), dismissButton: Alert.Button.default(Text("Restart Game"), action: {
                computerChoice = moves.randomElement()!
                shouldWin.toggle()
                score = 0
                rounds = 0
            }))
        }
    }
    
//    func hasWon(computer: String, user: String) -> Bool {
//        switch (user, computer) {
//        case ("✊","✊"):
//            return false
//        case ("✊","✋"):
//            return false
//        case ("✊","✌️"):
//            return true
//        case ("✋", "✊"):
//            return true
//        case ("✋", "✋"):
//            return false
//        case ("✋", "✌️"):
//            return false
//        case ("✌️","✊"):
//            return false
//        case ("✌️","✋"):
//            return true
//        case ("✌️","✌️"):
//            return false
//        default: return false
//        }
//    }
//
//    func hasLost(computer: String, user: String) -> Bool {
//        switch (user, computer) {
//        case ("✊","✊"):
//            return false
//        case ("✊","✋"):
//            return true
//        case ("✊","✌️"):
//            return false
//        case ("✋", "✊"):
//            return false
//        case ("✋", "✋"):
//            return false
//        case ("✋", "✌️"):
//            return true
//        case ("✌️","✊"):
//            return true
//        case ("✌️","✋"):
//            return false
//        case ("✌️","✌️"):
//            return false
//        default: return false
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
