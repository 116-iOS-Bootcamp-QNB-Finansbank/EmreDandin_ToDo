//
//  ToDoPresenter.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation

class ToDoPresenter: NSObject, ToDoPresenterProtocol{
    private unowned let view: ToDoViewProtocol
    private let router: ToDoRouterProtocol
    private var interactor: ToDoInteractorProtocol
   
    
    init(interactor: ToDoInteractorProtocol, view: ToDoViewProtocol, router:ToDoRouterProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.viewDidLoad()
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        interactor.didSelectRow(at: indexPath)
    }
    
    func addItem() {
        interactor.addItem()        
    }
}

extension ToDoPresenter: ToDoInteractorDelegate {
    func handleOutput(_ output: ToDoInteractorOutput) {
        switch output {
        case .showToDoList(let todoList):            
            view.handleOutput(.showTodoList(todoList.map(ToDoPresentation.init)))
        case .showToDoDetail(let todo):
            router.navigate(to: .showToDoDetail(todo))
        case .showEmptyToDoDetail:
            router.navigate(to: .showEmptyToDoDetail)
        }
    }
}
