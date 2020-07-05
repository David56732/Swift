//
//  GroupCell.swift
//  FoodBuy
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class GroupCell: UICollectionViewCell {

    @IBOutlet weak var nameGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(group: Group){
        self.nameGroup.text = group.name
        
        
    }

}
