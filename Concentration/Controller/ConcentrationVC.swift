//
//  ViewController.swift
//  Concentration
//
//  Created by Kareem Ismail on 5/30/18.
//  Copyright © 2018 Whatever. All rights reserved.
//

import UIKit

class ConcentrationVC: UIViewController {
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (cardsCollection.count + 1) / 2
    }
    @IBOutlet private var mainView: UIView!
    @IBOutlet private weak var themeLabel: UILabel!
    @IBOutlet private weak var flipsLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardsCollection: [UIButton]!
    private var allThemesInformation: AllThemes = AllThemes.init()
    private lazy var randomTheme = allThemesInformation.themes.count.arc4random
    private var currentTheme: Theme {
        get {
            return allThemesInformation.themes[randomTheme]
        }
    }
    
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
        updateCardState()
        updateFlipsAndScoreLabels()
    }
    
    private func updateCardState(){
        for index in cardsCollection.indices {
            let card = game.cards[index]
            let button = cardsCollection[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? view.backgroundColor:currentTheme.cardNotMatchedYetColor
            }
        }
    }
    
    private func updateFlipsAndScoreLabels(){
        flipsLabel.text = "Flips: \(game.flipsCount)"
        scoreLabel.text = "Score: \(game.score)"
    }
    
    private lazy var emojis = currentTheme.emojis
    private var emojisDictionary = [Int:String]()
    private func emoji(for card: Card) -> String {
        if emojisDictionary[card.identifier] == nil, emojis.count > 0{
            let randomIndex = emojis.count.arc4random
            emojisDictionary[card.identifier] = emojis.remove(at: randomIndex)
        }
        return emojisDictionary[card.identifier] ?? "?"
    }
    
    private func updateThemeAndColor() {
        themeLabel.text = currentTheme.themeName
        mainView.backgroundColor = currentTheme.themeBackgroundColor
    }
    
    @IBAction private func newGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardsCollection.count + 1) / 2)
        randomTheme = Int(arc4random_uniform(UInt32(allThemesInformation.themes.count)))
        updateThemeAndColor()
        emojis = currentTheme.emojis
        emojisDictionary = [:]
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








