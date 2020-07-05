//
//  Menu.swift
//  FoodBuy
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import Foundation
import  UIKit
struct Group{
    var name: String
    var product: [Product]
}

struct Product {
    var  name: String
    var price: Float
    var image: UIImage
}

class Menu {
    var groups = [Group]()
    
    init() {
        setup()
    }
    func setup(){
        let p1 = Product(name: "Суши1", price: 100, image: UIImage(named: "p1")!)
        let p2 = Product(name: "Суши2", price: 150, image: UIImage(named: "p2")!)
        let p3 = Product(name: "Суши3", price: 300, image: UIImage(named: "p3")!)
        
        let p4 = Product(name: "Роллы1", price: 350, image: UIImage(named: "p4")!)
        let p5 = Product(name: "Роллы2", price: 100, image: UIImage(named: "p1")!)
        let p6 = Product(name: "Роллы3", price: 150, image: UIImage(named: "p2")!)
        
        let p7 = Product(name: "Суп1", price: 100, image: UIImage(named: "p1")!)
        let p8 = Product(name: "Суп2", price: 450, image: UIImage(named: "p2")!)
        let p9 = Product(name: "Суп3", price: 400, image: UIImage(named: "p3")!)
       
        let products1 = [p1, p2, p3]
        let products2 = [p4, p5, p6]
        let products3 = [p7, p8, p9]
        
        let g1 = Group(name: "Суши", product: products1)
        let g2 = Group(name: "Роллы", product: products2)
        let g3 = Group(name: "Супы", product: products3)
        let g4 = Group(name: "Горячее", product: products1)
        let g5 = Group(name: "Закуски", product: products2)
        let g6 = Group(name: "Фирменное", product: products3)
        let g7 = Group(name: "Напитки", product: products1)
        let g8 = Group(name: "Соусы", product: products2)
        let g9 = Group(name: "Другое", product: products3)
        
        self.groups = [g1, g2, g3, g4, g5, g6, g7, g8, g9]
    }
}

// Для оптимизации шрифта текста
extension String{
    func widthOfString(usingFoat font: UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font : font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}
