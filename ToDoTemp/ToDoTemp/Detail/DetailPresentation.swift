//
//  DetailPresntation.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
struct DetailPresentation {
    var name: String
    var detail: String
    var finishDate: Date
    var uuid : UUID?
    
    init(name: String, detail: String, finishDate: Date) {
        self.name = name
        self.detail = detail
        self.finishDate = finishDate
    }
    
    init(name: String, detail: String, finishDate: Date, uuid: UUID) {
        self.name = name
        self.detail = detail
        self.finishDate = finishDate
        self.uuid = uuid
    }
    
    init(todo: ToDoEntity) {
        self.init(name: todo.name!,
                  detail: todo.detail!,
                  finishDate: todo.finishDate!,
                  uuid: todo.id ?? UUID())
    }
}
