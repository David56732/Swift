//
//  ProductCell.swift
//  FoodBuy
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var nameProduct: UILabel!
    
    @IBOutlet weak var priceProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.productImage.image = UIImage(named: "loading")
    }

    func setupCell(product: Product){
        self.productImage.image = product.image
        self.nameProduct.text = product.name
        self.priceProduct.text = "\(product.price) руб."
    }
}
