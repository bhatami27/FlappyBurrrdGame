//
//  AppDelegate.swift
//  FlabbyBurrd
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 5/4/21
//


import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var customizationModel : CustomizationModel = CustomizationModel()
    var highScoreTableModel : HighScoreTableModel = HighScoreTableModel()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
                 The persistent container for the application. This implementation
                 creates and returns a container, having loaded the store for the
                 application to it. This property is optional since there are legitimate
                 error conditions that could cause the creation of the store to fail.
                */
                // We used this website
                // https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
                // as a reference for CoreData
        
        let container = NSPersistentContainer(name: "FlabbyBurrdModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // We used this website
       // https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
       // as a reference for CoreData
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

