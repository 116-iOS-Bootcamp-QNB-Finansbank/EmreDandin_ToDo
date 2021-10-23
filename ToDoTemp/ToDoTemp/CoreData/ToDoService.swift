//
//  ToDoService.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
import CoreData

protocol ToDoServiceProtocol {
    func getToDos() ->  [ToDoEntity]
}
class ToDoService: ToDoServiceProtocol {
    private let coreDataService = CoreDataService.instance
    func getToDos() -> [ToDoEntity] {
        let context = CoreDataService.getContext()
        let request: NSFetchRequest<ToDoEntity> = ToDoEntity.fetchRequest()
        var result: [ToDoEntity] = []
        do{
            result = try context.fetch(request)
        } catch{
            //TODO:
        }
        return result
    }
}
