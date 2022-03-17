//
//  CustomizationModel.swift
//  FlabbyBurrd
//
//  Created by Taylor, Dylan D on 5/3/21.
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
