//
//  ToDoListViewController.swift
//  ToDoTemp
//
//  Created by Emre Dandin on 17.10.2021.
//

import UIKit

class ToDoListViewController: UIViewController, ToDoViewProtocol{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    let notificationKey = "updated"
    @IBAction func addButtonTapped(_ sender: Any) {
        presenter.addItem()
        presenter.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                                    selector: #selector(updated),
                                                    name: NSNotification.Name(rawValue: notificationKey),
                                                    object: nil)
    }
    
    @objc func updated() {
        self.presenter.viewDidLoad()
   }
    
    
    var presenter: ToDoPresenterProtocol!
    var toDoList: [ToDoPresentation] = []
    var filteredToDoList: [ToDoPresentation] = []

    func handleOutput(_ output: ToDoPresenterOutput) {
        switch output {
        case .showTodoList(let todoLists):
            self.toDoList = todoLists
            self.filteredToDoList = todoLists
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    func updateTodoList() {
        self.presenter.viewDidLoad()
    }
}


extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let index: IndexPath = IndexPath(row: filteredToDoList[indexPath.row].index, section: 0)
        presenter.didSelectRow(at: indexPath)
    }
}

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredToDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        cell.textLabel?.text = filteredToDoList[indexPath.row].name
        return cell
    }
       
}
extension ToDoListViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredToDoList = searchText.isEmpty ? toDoList : toDoList.filter { (toDo) in
            return toDo.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
}
