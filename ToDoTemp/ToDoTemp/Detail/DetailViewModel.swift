//
//  DetailViewModel.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import Foundation
import UIKit
import UserNotifications

class DetailViewModel: DetailViewModelProtocol{
    
    var delegate: DetailViewModelDelegate?
    private var todo: ToDoEntity?
    init(){
        
    }
    init(todo: ToDoEntity) {
        self.todo = todo
    }
    func viewDidLoad() {
        if(todo != nil){
            delegate?.showToDoDetail(DetailPresentation(todo: todo!))
        }
    }
    
    func saveTodo(todoDetailPresentation: DetailPresentation) {
        
        let context = CoreDataService.getContext()
        
        if todo == nil {
            todo = ToDoEntity(context: context)
            todo!.id = UUID()
        }
        
        todo!.name = todoDetailPresentation.name
        todo!.detail = todoDetailPresentation.detail
        todo!.finishDate = todoDetailPresentation.finishDate
         
        CoreDataService.saveContext(context)        
    }
    
    func createNotification(notificationCenter: UNUserNotificationCenter){
        let not = UNMutableNotificationContent()
        not.title = todo!.name!+" bitti mi bakim?"
        not.body = todo!.name!+" şimdiye kadar bitmeliydi!"
        
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: todo!.finishDate!)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: not, trigger: trigger)
        notificationCenter.add(request) { error in
            //handle error
        }
    }
    
    func deleteTodo() {
        if(todo != nil){
            do {
                CoreDataService.getContext().delete(todo!)
            }
        }
            
    }
    
}
