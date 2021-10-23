//
//  DetailViewController.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import UIKit
import UserNotifications

class DetailViewController: UIViewController {

    @IBOutlet weak var detail: UITextView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var dateTimePicker: UIDatePicker!
    let notificationCenter = UNUserNotificationCenter.current()
    var viewModel: DetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()        
        notificationCenter.requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
        }
        viewModel.viewDidLoad()
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let nameText = name.text, name != nil else { return }
        guard let detailText = detail.text, detail != nil else { return }
        
        let detailPresentation = DetailPresentation(name: nameText, detail: detailText, finishDate: dateTimePicker.date)
        
        viewModel.saveTodo(todoDetailPresentation: detailPresentation)
        viewModel.createNotification(notificationCenter: notificationCenter)
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updated"), object: self)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {        
        viewModel.deleteTodo()
        NotificationCenter.default.post(name: Notification.Name(rawValue: "updated"), object: self)
        navigationController?.popViewController(animated: true)
        
    }
}

extension DetailViewController: DetailViewModelDelegate {
    
    func showToDoDetail(_ toDo: DetailPresentation) {
        name.text = toDo.name
        detail.text = toDo.detail
        dateTimePicker.date = toDo.finishDate
    }
}
