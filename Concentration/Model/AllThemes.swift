//
//  AllThemes.swift
//  Concentration
//
//  Created by Kareem Ismail on 1/11/19.
//  Copyright © 2019 Whatever. All rights reserved.
//

import UIKit

struct AllThemes {
    var themes: [Theme] = []
     init(){
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), themeName: "Sports", emojis: ["⚽️","🎾","🏓","🏐", "🥊", "⛳️", "🎱", "🎣"]))
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), themeName: "Flags", emojis: ["🇧🇷","🇩🇪","🇮🇸","🇮🇳","🇮🇹","🇵🇸","🇫🇷","🇪🇸","🇵🇭"]))
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), themeName: "Emojis", emojis: ["🤪","🤬","🤢","😈","💩","🤣","🤮","👹","💀"]))
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), themeName: "Animals", emojis: ["🐶","🙈","🦁","🐝","🐲","🐎","🐞","🦉","🐨"]))
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), themeName: "Sports", emojis: ["🏕","🏖","🏟","🏯","🏔","⛩","🕋","🛤","🏛"]))
        themes.append(Theme.init(themeBackgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardNotMatchedYetColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), themeName: "Halloween", emojis: ["👻","🦀","👺","🎃","🤡","🧜‍♂️","🧞‍♂️","🖕"]))
    }
}
