//
//  PhotoCell.swift
//  PhotoGallery
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var imageField: UIImageView!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupCell(photo: UIImage){
        self.imageField.image = photo
    }
   
}
