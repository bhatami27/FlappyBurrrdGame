//
//  CustomizationModel.swift
//  FlabbyBurrd
//
//  Created by Taylor, Dylan D on 5/3/21.
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 5/4/21
//

import Foundation

class CustomizationModel {
    var bgPhoto : Int = 0
    
    func setDaytime() {
        self.bgPhoto = 0
    }
    
    func setNighttime() {
        self.bgPhoto = 1
    }
    
    func getBGImage() -> Int {
        return self.bgPhoto
    }
}
