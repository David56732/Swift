//
//  EditViewController.swift
//  DeathNote
//
//  Created by Dave on 29.06.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

   
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    var day : String?
    var completion : ((String, String, String) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTextField.layer.borderWidth = 1
        detailsTextField.layer.borderColor = UIColor.opaqueSeparator.cgColor
        detailsTextField.layer.cornerRadius = 3
    }
    

    @IBAction func doneAction(_ sender: Any) {
        addAndBack()
    }
    
    private func addAndBack(){
        guard let name = nameTextField.text, let details = detailsTextField.text else {
            navigationController?.popViewController(animated: true)
            return
        }
        day = getDateFromPicker()
        completion?(name, details, day!)
        navigationController?.popViewController(animated: true)
    }
    
    func getDateFromPicker() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy hh:mm a"
        return (formatter.string(from: datePicker.date))
        
    }
    
    
}
