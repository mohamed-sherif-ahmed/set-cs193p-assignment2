//
//  CardUIView.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 7/2/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import UIKit

class CardUIView: UIView {
    
    var card: Card? {
        didSet {
            setNeedsDisplay()
        }
    }
    
//    init(_ c: Card){
//        card = c
//        super.init(frame: bounds)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//
    func drawCard(){
        let color: UIColor
        switch card!.color {
        case .Blue:
            color = .blue
        case .Orange:
            color = .orange
        case .White:
            color = .gray
        }
        
        let shape: String
        switch card!.shape {
        case .Triangle:
            shape = "▲"
        case .Circle:
            shape = "●"
        case .Square:
            shape = "■"
        }
        
        let finalString: String
        switch card!.number {
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
        switch card!.shade {
        case .Solid:
            shade = [.font: UIFont.systemFont(ofSize: 32), .foregroundColor: color]
        case .Dotted:
            shade = [.font: UIFont.systemFont(ofSize: 32), .strokeWidth: -20.0, .foregroundColor: color, .strokeColor: UIColor.black]
        case .Stripes:
            shade = [.font: UIFont.systemFont(ofSize: 32), .foregroundColor: color.withAlphaComponent(0.40) ]
        }
        let string = NSAttributedString(string: finalString, attributes: shade)
        //TODO: implement drawing
        
        string.draw(at: CGPoint(x: bounds.width/2 - string.size().width/2, y: bounds.height/2 - string.size().height/2))
    }

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // creates UIBezierPath
        self.backgroundColor = UIColor.white
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(15.0))
        roundedRect.addClip() // ??
        UIColor.lightGray.set() // sets color
        roundedRect.fill() // uses the color to fill the area of the path
        if card != nil {
            drawCard()
        }
    }
}
