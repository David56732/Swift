//
//  FullScreenViewController.swift
//  PhotoGallery
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit


class FullScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let countCell = 1
    var photoGallery: PhotoGallery!
    var indexpath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FullScreenCollectionViewCell")
        
        collectionView.performBatchUpdates(nil, completion: { (result) in
            self.collectionView.scrollToItem(at: self.indexpath, at: .centeredHorizontally, animated: false)
        })

        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension FullScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FullScreenCollectionViewCell", for: indexPath) as! FullScreenCollectionViewCell
        DispatchQueue.main.async {
            cell.photoView.image = self.photoGallery.images[indexPath.item]
        }
        return cell
        
    }
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(countCell)
        let heightCell = widthCell
   
        return CGSize(width: widthCell, height: heightCell)
    }
}
