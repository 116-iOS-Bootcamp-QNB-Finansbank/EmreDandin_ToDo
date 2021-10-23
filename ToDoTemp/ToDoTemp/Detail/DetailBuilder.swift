//
//  DetailBuilder.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
import UIKit
class TodoDetailBuilder {
    static func build(with todo: ToDoEntity) -> DetailViewController {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        viewController.viewModel = DetailViewModel(todo: todo)
        return viewController
    }
    static func buildEmpty() -> DetailViewController {
        
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        viewController.viewModel = DetailViewModel()
        return viewController
    }
}

