//
//  ViewController.swift
//  Concentration
//
//  Created by Kareem Ismail on 5/30/18.
//  Copyright © 2018 Whatever. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (cardsCollection.count + 1) / 2
    }
    @IBOutlet private var mainView: UIView!
    @IBOutlet private weak var themeLabel: UILabel!
    @IBOutlet private weak var flipsLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardsCollection: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateThemeAndColor()
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        let cardNumber = cardsCollection.index(of: sender)!
        game.chooseCard(at: cardNumber)
        updateViewFromModel()
    }
    
    private func updateViewFromModel(){
        for index in cardsCollection.indices {
            let card = game.cards[index]
            let button = cardsCollection[index]
            flipsLabel.text = "Flips: \(game.flipsCount)"
            scoreLabel.text = "Score: \(game.score)"
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                switch randomTheme {
                    case 0 : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    case 1 : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                    case 2 : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                    case 3 : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                    case 4 : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    default : button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0):#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                }
                
            }
        }
    }
    private lazy var randomTheme = emojisThemes.count.arc4random
    private lazy var emojis = emojisThemes[randomTheme]!
    private var emojisThemes = [
        0 : ["⚽️","🎾","🏓","🏐", "🥊", "⛳️", "🎱", "🎣"],
        1 : ["🇧🇷","🇩🇪","🇮🇸","🇮🇳","🇮🇹","🇵🇸","🇫🇷","🇪🇸","🇵🇭"],
        2 : ["🤪","🤬","🤢","😈","💩","🤣","🤮","👹","💀"],
        3 : ["🐶","🙈","🦁","🐝","🐲","🐎","🐞","🦉","🐨"],
        4 : ["🏕","🏖","🏟","🏯","🏔","⛩","🕋","🛤","🏛"],
        5 : ["👻","🦀","👺","🎃", "🤡", "🧜‍♂️", "🧞‍♂️", "🖕"]
    ]
    private var emojisDictionary = [Int:String]()
    private func emoji(for card: Card) -> String {
        if emojisDictionary[card.identifier] == nil, emojis.count > 0{
            let randomIndex = emojis.count.arc4random
            emojisDictionary[card.identifier] = emojis.remove(at: randomIndex)
        }
        return emojisDictionary[card.identifier] ?? "?"
    }
    
    private func updateThemeAndColor() {
        switch randomTheme {
        case 0:
            themeLabel.text = "Sports"
            mainView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 1:
            themeLabel.text = "Flags"
            mainView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        case 2:
            themeLabel.text = "Smileys"
            mainView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 3:
            themeLabel.text = "Animals"
            mainView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 4:
            themeLabel.text = "Places"
            mainView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        default:
            themeLabel.text = "Halloween"
            mainView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    

    
    @IBAction private func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardsCollection.count + 1) / 2)
        randomTheme = Int(arc4random_uniform(UInt32(emojisThemes.count)))
        updateThemeAndColor()
        emojis = emojisThemes[randomTheme]!
        emojisDictionary = [Int:String]()
        updateViewFromModel()
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}





