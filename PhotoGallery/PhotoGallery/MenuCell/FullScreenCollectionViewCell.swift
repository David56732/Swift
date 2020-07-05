//
//  FullScreenCollectionViewCell.swift
//  PhotoGallery
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.5
        // Initialization code
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        photoView
    }

    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }
}
