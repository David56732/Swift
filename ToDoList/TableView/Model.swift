//
//  Model.swift
//  TableView
//
//  Created by Dave on 25.06.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import Foundation

var ToDoItems: [[String:Any]] {
    get{
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        }else{
            return []
        }
    }
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
}

func moveItem(fromIndex: Int, toIndex: Int){
    let from = ToDoItems[fromIndex]
           ToDoItems.remove(at: fromIndex)
           ToDoItems.insert(from, at: toIndex)
}

func addItem(nameItem: String, isCompleted : Bool = false){
    ToDoItems.append(["Name" : nameItem, "isCompleted" : isCompleted])
}

func removeItem(at index: Int){
    ToDoItems.remove(at: index)

}
func changeState(at index: Int) -> Bool{
    ToDoItems[index]["isCompleted"] = !(ToDoItems[index]["isCompleted"] as! Bool)
    return (ToDoItems[index]["isCompleted"] as! Bool)
    
}

func countNotCompleted() -> Int{
    var count = 0
    for i in ToDoItems{
        if i["isCompleted"] as! Bool == false{
            count += 1
        }
    }
    print (count)
    return count
}

