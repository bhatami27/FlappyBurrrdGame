//
//  HighScoreTableModel.swift
//  FlabbyBurrd
//
//  Created by Zach Kilmer on 5/3/21.
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 5/4/21
//

import Foundation
import UIKit
import CoreData

class HighScoreTableModel {
    
    // We used this website
       // https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
       // as a reference for CoreData for this class
    var highScores: [NSManagedObject] = []
    var appDelegate : AppDelegate?
    
    func LoadData(){
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
              return
          }
          
          let managedContext =
            appDelegate.persistentContainer.viewContext
          
          //2
          let fetchRequest =
            NSFetchRequest<NSManagedObject>(entityName: "Score")
          
          //3
          do {
            highScores = try managedContext.fetch(fetchRequest)
          } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
          }

    }
    
    // We used this website
       // https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
       // as a reference for CoreData for this class
    
    func saveScore(total: Int16) {
      
      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      // 1
      let managedContext =
        appDelegate.persistentContainer.viewContext
      
      // 2
      let entity =
        NSEntityDescription.entity(forEntityName: "Score",
                                   in: managedContext)!
      
      let Scores = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
      
      // 3
      Scores.setValue(total, forKeyPath: "total")
      
      // 4
      do {
        try managedContext.save()
        highScores.append(Scores)
      } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
      }
    }
    
    // We used this website
       // https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
       // as a reference for CoreData for this class
    
    func getCoreArray() -> [NSManagedObject] {
        return highScores.sorted(by: { $0.value(forKeyPath: "total") as! Int16 > $1.value(forKeyPath: "total") as! Int16})
    }
    
}
