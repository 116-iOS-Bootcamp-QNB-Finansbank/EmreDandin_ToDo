//
//  ToDoListInteractor.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import UIKit
import Foundation

class ToDoListInteractor: NSObject, ToDoInteractorProtocol {
    weak var delegate: ToDoInteractorDelegate?
    private let service: ToDoService
    private var toDoList: [ToDoEntity] = []
    
    init(service: ToDoService) {
        self.service = service
    }
    
    func viewDidLoad() {
        getToDoList()
    }
    
    func getToDoList() {
        let results: [ToDoEntity] = service.getToDos()
        self.toDoList = results
        self.delegate?.handleOutput(.showToDoList(results))
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        self.delegate?.handleOutput(.showToDoDetail(toDo))
    }
    
    func addItem() {
        self.delegate?.handleOutput(.showEmptyToDoDetail)
    }
}

