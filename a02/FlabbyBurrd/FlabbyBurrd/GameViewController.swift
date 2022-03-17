//
//  GameViewController.swift
//  FlabbyBurrd
//
//  Created by Bryan Hatami on 4/26/21.
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 4/27/21

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    public var gameStarted : Bool = false

    @IBOutlet weak var pushToPlay: UIButton!
    @IBOutlet weak var setBackImage: UIImageView!
    @IBOutlet weak var flappyBurrdSign: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pushToPlay.layer.borderWidth = 1.7
        pushToPlay.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        pushToPlay.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        pushToPlay.layer.cornerRadius = 8.5
    }

    override var shouldAutorotate: Bool { return true }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    

    @IBAction func loadGameButton(_ sender: Any) {
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for game load button
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                self.gameStarted = true
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                pushToPlay.isHidden = true
                flappyBurrdSign.isHidden = true
                setBackImage.isHidden = true
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    
    override var prefersStatusBarHidden: Bool { return true }
}
