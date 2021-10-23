//
//  App.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation

let appContainer = AppContainer()

class AppContainer {
    let service = ToDoService()
    let router = AppRouter()
}
