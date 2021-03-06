//
//  CoreDataService.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
import CoreData
import UIKit

class CoreDataService {
    static let instance = CoreDataService()
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static func getContext()-> NSManagedObjectContext{
        let persistantContainer = appDelegate.persistentContainer
        let context = persistantContainer.viewContext
        return context
    }
        
    static func saveContext(_ context: NSManagedObjectContext) {
        do {
           try context.save()
        }
        catch {
        }
    }
    
}
