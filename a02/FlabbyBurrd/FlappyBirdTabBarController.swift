//
//  FlappyBirdTabBarController.swift
//  FlabbyBurrd
//
//  Created by Taylor, Dylan D on 5/3/21.
//

import UIKit
import SpriteKit
import GameplayKit

class FlappyBirdTabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController is GameViewController && (viewController as! GameViewController).gameStarted {
            (viewController as? GameViewController)?.loadGameButton(0)
        } else if viewController is HighScoreTableViewController {
            (viewController as? HighScoreTableViewController)?.tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
