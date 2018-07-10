//
//  GameViewController.swift
//  set-assignment
//
//  Created by Mohamed Sherif on 7/6/18.
//  Copyright © 2018 Mohamed Sherif. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    lazy var game = Set()
    @IBOutlet var board: CardBoard!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func dealCards(_ sender: UIButton) {
        board.addCard(toBeDrawn: game.draw())
    }
}
