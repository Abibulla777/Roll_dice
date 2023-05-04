//
//  ViewController.swift
//  roll_dice
//
//  Created by abibulla on 20.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstDice: UIImageView!
    @IBOutlet weak var SecondDice: UIImageView!
    @IBOutlet weak var rollButton: UIButton!

    
    
    let diceNames = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func rollPressed(_ sender: Any) {
        let dice1: Int = Int(arc4random()) % 6
        let dice2: Int = Int(arc4random()) % 6
        
        FirstDice.image = UIImage(named: diceNames[dice1])
        SecondDice.image = UIImage(named: diceNames[dice2])
        
        if dice1 == dice2 {
        
            
//            showAlert(title: "You win!", message: "Start again the game")
//            UIView.animate(withDuration: 1.0, animations: {
//                self.FirstDice.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//                self.SecondDice.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//            }, completion: { (finished) in
//                if finished {
//                    self.showDancingGirl()
//                }
//            })
            print("equal")
            showDancingGirl()
        }
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            rollPressed(rollButton!)
        }
    }
//    func showAlert(title: String, message: String) {
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alert.addAction(okAction)
//            present(alert, animated: true, completion: nil)
//    }
    func showDancingGirl() {
        let dancingGirlImageView = UIImageView(image: UIImage(named: "dancinggirl"))
        dancingGirlImageView.isHidden = false
        dancingGirlImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        dancingGirlImageView.contentMode = .scaleAspectFit
        view.addSubview(dancingGirlImageView)
        dancingGirlImageView.alpha = 0.0
//        print("Show func")
        UIView.animate(withDuration: 1.0, animations: {
            dancingGirlImageView.alpha = 1.0
        }) { (finished) in
            if finished {
                UIView.animate(withDuration: 5.0, animations: {
                    dancingGirlImageView.alpha = 0.0
                }, completion: { (finished) in
                    dancingGirlImageView.removeFromSuperview()
                })
            }
        }
    }
}

