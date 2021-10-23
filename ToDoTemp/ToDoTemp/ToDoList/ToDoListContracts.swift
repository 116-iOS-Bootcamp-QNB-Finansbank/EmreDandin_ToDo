//
//  ToDoListContracts.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation

//MARK: View
protocol ToDoViewProtocol: NSObject {
    func handleOutput(_ output: ToDoPresenterOutput)
}

//MARK: Interactor
enum ToDoInteractorOutput {
    case showEmptyToDoDetail
    case showToDoDetail(ToDoEntity)
    case showToDoList([ToDoEntity])
}

protocol ToDoInteractorDelegate: NSObject {
    func handleOutput(_ output: ToDoInteractorOutput)
}

protocol ToDoInteractorProtocol: NSObject {
    var delegate: ToDoInteractorDelegate? { get set }
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func addItem()
}

//MARK: Presenter
protocol ToDoPresenterProtocol: NSObject {
    func viewDidLoad()
    func didSelectRow(at indexPath: IndexPath)
    func addItem()
}

enum ToDoPresenterOutput {
    case showTodoList([ToDoPresentation])
}

//MARK: Router
enum ToDoRoute {
    case showToDoDetail(ToDoEntity)
    case showEmptyToDoDetail
}

protocol ToDoRouterProtocol: NSObject {
    func navigate(to route: ToDoRoute)
}
