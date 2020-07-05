//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    let photoGallery = PhotoGallery()
    
    let countCell = 2
    let offset: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCell")
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        
    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        DispatchQueue.main.async{
            cell.setupCell(photo: self.photoGallery.images[indexPath.item])
        }
        return cell
        
        
    }
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widthCell = frameCV.width / CGFloat(countCell)
        let heightCell = widthCell
        let spacing = CGFloat(countCell + 1) * offset / CGFloat(countCell)
        return CGSize(width: widthCell - spacing , height: heightCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenViewController") as! FullScreenViewController
       
        vc.photoGallery = photoGallery
        vc.indexpath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
        
        if vc.photoGallery.images[indexPath.item] == UIImage(named: "error"){
            let alertController = UIAlertController(title: "Error", message: "Bad internet connection", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }

}
