//
//  ViewController.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 6/16/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cards: [UIButton]!
    lazy var game = Set()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for b in cards {
            b.setTitle(nil, for: .normal)
            b.setAttributedTitle(nil, for: .normal)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func handleButton(_ sender: UIButton) {
        if let index = cards.index(of: sender) {
            cards[index].backgroundColor = UIColor.cyan
            
        } else {
            print("Card is Nil!!")
        }
    }
    
    @IBAction func dealThreeCards(_ sender: UIButton) {
        let emptyUICards = getEmptyCards()
        if emptyUICards.count > 2{
            for i in 0...2{
                let cardDeck = game.getAvailableCards()
                let newUICard = emptyUICards[i]
                var card = cardDeck[i]
                setCardToUI(cardUI: newUICard, cardData: card)
                card.match()
                
            }
        }
    }
    
    func setCardToUI(cardUI ui: UIButton, cardData d: Card){
        let color: UIColor
        switch d.color {
        case .Blue:
            color = .blue
        case .Orange:
            color = .orange
        case .White:
            color = .gray
        }
        
        let shape: String
        switch d.shape {
        case .Triangle:
            shape = "▲"
        case .Circle:
            shape = "●"
        case .Square:
            shape = "■"
        }
        
        let finalString: String
        switch d.number {
        case 1:
            finalString = shape
        case 2:
            finalString = "\(shape) \(shape)"
        case 3:
            finalString = "\(shape) \(shape) \(shape)"
        default:
            finalString = shape
        }
        
        let shade: [NSAttributedStringKey: Any];
        switch d.shade {
        case .Solid:
            shade = [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: color]
        case .Dotted:
            shade = [.font: UIFont.systemFont(ofSize: 24), .strokeWidth: -20.0, .foregroundColor: color, .strokeColor: UIColor.black]
        case .Stripes:
            shade = [.font: UIFont.systemFont(ofSize: 24), .foregroundColor: color.withAlphaComponent(0.40) ]
        }
        let string = NSAttributedString(string: finalString, attributes: shade)
        ui.setAttributedTitle(string, for: .normal)
    }
    
    func getEmptyCards() -> [UIButton] {
        return cards.filter({$0.currentTitle == nil && $0.currentAttributedTitle == nil})
    }
}

