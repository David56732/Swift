//
//  ViewController.swift
//  Calculation
//
//  Created by Dave on 21.06.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen : Double = 0
    var firstNum : Double = 0
    var sign : Bool = false
    var opertation : Int  = 0
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func digits(_ sender: UIButton) {
        if sign == true{
            result.text = String(sender.tag)
            sign = false
        }else{
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 16
        {
            if result.text != "+" && result.text != "-" && result.text != "/" && result.text != "×"{
                firstNum = Double(result.text!)!
            }
            if sender.tag == 12{// деление
                result.text = "/"
            }
            else if sender.tag == 13{ //  умножение
                result.text = "×"
            }
            else if sender.tag == 14{ // вычитание
                result.text = "-"
            }
            else if sender.tag == 15{ // сложение
                result.text = "+"
            }
            sign = true
            opertation = sender.tag
        }else if sender.tag == 16{ //посчитать
            if opertation == 12{
                result.text = String(firstNum / numberFromScreen)
            }else if opertation == 13{
                result.text = String(firstNum * numberFromScreen)
            }else if opertation == 14{
                result.text = String(firstNum - numberFromScreen)
            }else if opertation == 15{
                result.text = String(firstNum + numberFromScreen)
            }
        }else if sender.tag == 10{
            numberFromScreen = 0
            opertation = 0
            sign = false
            result.text = ""
        }
        if sender.tag == 11{
            if let res = result.text, let res1 = Double(res){
                    result.text = String(-res1)
            }
/*
        if sender.tag == 11{
            result.text = String(-Double(result.text!)!)
            
        }*/
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

