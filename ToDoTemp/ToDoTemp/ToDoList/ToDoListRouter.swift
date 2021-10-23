//
//  ToDoListRouter.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import UIKit

class ToDoListRouter: NSObject, ToDoRouterProtocol {
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: ToDoRoute) {
        switch route {
        case .showToDoDetail(let todo):
            let viewController = TodoDetailBuilder.build(with: todo)
            self.view.navigationController?.pushViewController(viewController, animated: true)        
        case .showEmptyToDoDetail:
            let viewController = TodoDetailBuilder.buildEmpty()
            self.view.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}


