//
//  GameViewController.swift
//  TicTacToeaas
//
//  Created by Tom McGee on 7/8/16.
//  Copyright © 2016 Tom McGee. All rights reserved.
//

import UIKit

public class GameViewController: UIViewController {
    var xTurn = true;
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    public func getPlayerLabel(playerNumber: Int) -> String {
        return "Player \(playerNumber)'s Turn!"
    }
    
    @IBOutlet weak var boardStackView: UIStackView!

    @IBOutlet weak var playerTurnLabel: UILabel!
    @IBAction func resetGame() {
        playerTurnLabel.text = getPlayerLabel(1)
        xTurn = true
        for view in boardStackView.subviews{
            for button in view.subviews {
                let btn = button as! UIButton
                btn.setBackgroundImage(nil, forState: .Normal)
                btn.enabled = true
            }
        }
    }
    public func scaleImage(image: UIImage, scaledToSize newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    @IBAction public func markerButtonClicked(sender: UIButton) {
        let height = sender.frame.height
        let width = sender.frame.width
        var letter: UIImage?
        if (xTurn) {
            letter = UIImage(named: "letter-x", inBundle: nil, compatibleWithTraitCollection: nil)
            playerTurnLabel.text = getPlayerLabel(2)
        } else {
            letter = UIImage(named: "letter-o", inBundle: nil, compatibleWithTraitCollection: nil)
            playerTurnLabel.text = getPlayerLabel(1)
        }
        let newImage: UIImage = scaleImage(letter!, scaledToSize: CGSizeMake(width, height))
        sender.setBackgroundImage(newImage, forState: .Normal)
        xTurn = !xTurn
        sender.enabled = false
    }
}
