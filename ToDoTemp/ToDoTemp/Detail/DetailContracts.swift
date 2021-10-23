//
//  DetailContracts.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
import UserNotifications

protocol DetailViewModelDelegate: NSObject {
    func showToDoDetail(_ toDo: DetailPresentation)
}

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate? { get set }
    func viewDidLoad()
    func saveTodo(todoDetailPresentation : DetailPresentation)
    func createNotification(notificationCenter :UNUserNotificationCenter)
    func deleteTodo()
}
