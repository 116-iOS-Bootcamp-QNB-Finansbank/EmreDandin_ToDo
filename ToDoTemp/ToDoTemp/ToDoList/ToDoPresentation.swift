//
//  ToDoPresentation.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation

struct ToDoPresentation{
    let name: String
    let finishDate: Date
    
    init(name: String, finishDate: Date) {
        self.name = name
        self.finishDate = finishDate
    }
    
    init(todo: ToDoEntity) {
        self.init(name: todo.name!, finishDate: todo.finishDate!)
    }
}
