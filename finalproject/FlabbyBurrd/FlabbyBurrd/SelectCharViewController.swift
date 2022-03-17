//
//  SelectCharViewController.swift
//  FlabbyBurrd
//
//  Created by Bryan Hatami on 5/2/21.
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 5/4/21
//

import UIKit

class SelectCharViewController: UIViewController {
    
    var appDelegate : AppDelegate?
    var customizationModel : CustomizationModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.customizationModel = self.appDelegate?.customizationModel
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nightShift(_sender: UIButton){
        self.customizationModel?.setNighttime()
    }
    
    @IBAction func dayShift(_sender: UIButton){
        self.customizationModel?.setDaytime()
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
