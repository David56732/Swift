//
//  DeathTableViewController.swift
//  DeathNote
//
//  Created by Dave on 29.06.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class DeathTableViewController : UITableViewController
{

    var nameDeath : [String] {
        get{
            if let name = UserDefaults.standard.array(forKey: "nameDeath") as? [String]{
              return name
            }
            else{
                return []
            }
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "nameDeath")
            UserDefaults.standard.synchronize()
        }
    }
    var descriptionDeath : [String]{
        get{
            if let description = UserDefaults.standard.array(forKey: "descriptionDeath") as? [String]{
              return description
            }
            else{
                return []
            }
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "descriptionDeath")
            UserDefaults.standard.synchronize()
        }
    }
    var dayDeath : [String] {
        get{
            if let day = UserDefaults.standard.array(forKey: "dayDeath") as? [String]{
              return day
            }
            else{
                return []
            }
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "dayDeath")
            UserDefaults.standard.synchronize()
        }
    }
    
//    ДЛЯ УДАЛЕНИЯ ДАННЫХ User.defaults
//    let domain = Bundle.main.bundleIdentifier!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = UIColor.black
    
        
        // ДЛЯ УДАЛЕНИЯ ДАННЫХ User.defaults

//        UserDefaults.standard.removePersistentDomain(forName: domain)
//        UserDefaults.standard.synchronize()
//        print(Array(UserDefaults.standard.dictionaryRepresentation().keys).count)
//        print(UserDefaults.standard.array(forKey: "nameDeath") as Any)
//        print(UserDefaults.standard.array(forKey: "descriptionDeath") as Any)
//        print(UserDefaults.standard.array(forKey: "dayDeath") as Any)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return nameDeath.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeathCell", for: indexPath) as! DeathTableViewCell
        cell.dataLabel.text = dayDeath[indexPath.row]
        cell.nameLabel.text = nameDeath[indexPath.row]
        cell.detailsLabel.text = descriptionDeath[indexPath.row]
        cell.layer.borderWidth = 7
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            nameDeath.remove(at: indexPath.row)
            descriptionDeath.remove(at: indexPath.row)
            dayDeath.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if case let controller as EditViewController = segue.destination, segue.identifier == "toEdit"{
            
            controller.completion = {[unowned self] name, details, day in
                if name == "" || details == ""
                {
                   let alertController = UIAlertController(title: "Неверный ввод данных", message: "Заполните все поля", preferredStyle: .alert)
                    let alertActon = UIAlertAction(title: "Ок", style: .default, handler: nil)
                    alertController.addAction(alertActon)
                    self.present(alertController, animated: true, completion: nil)
                }else{
                    self.nameDeath.append(name)
                    self.descriptionDeath.append(details)
                    self.dayDeath.append(day)
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
   
    @IBAction func editAction(_ sender: UIBarButtonItem) {
        tableView.setEditing(!tableView.isEditing, animated: true )
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let fromName = nameDeath[sourceIndexPath.row]
        let fromDescription = descriptionDeath[sourceIndexPath.row]
        let fromDay = dayDeath[sourceIndexPath.row]

        nameDeath.remove(at: sourceIndexPath.row)
        descriptionDeath.remove(at: sourceIndexPath.row)
        dayDeath.remove(at: sourceIndexPath.row)

        nameDeath.insert(fromName, at: destinationIndexPath.row)
        descriptionDeath.insert(fromDescription, at: destinationIndexPath.row)
        dayDeath.insert(fromDay, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    
}
