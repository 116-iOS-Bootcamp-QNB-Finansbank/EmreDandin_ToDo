//
//  ToDoListBuilder.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import UIKit


class ToDoListBuilder {
    static func build() -> ToDoListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "ToDoListViewController") as! ToDoListViewController
        let interactor = ToDoListInteractor(service: appContainer.service)
        let router = ToDoListRouter(view: view)
        let presenter = ToDoPresenter(interactor: interactor, view: view as ToDoViewProtocol, router: router)
        view.presenter = presenter
        interactor.delegate = presenter
        return view
    }
}
