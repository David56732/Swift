//
//  MenuViewController.swift
//  FoodBuy
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit
var menu = Menu()
class MenuViewController: UIViewController{

    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var groupsCollectionvView: UICollectionView!
    
    var selectedGroupIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        self.CollectionView.dataSource = self
        self.CollectionView.delegate = self
        
        self.groupsCollectionvView.register(UINib(nibName: "GroupCell", bundle: nil) , forCellWithReuseIdentifier: "GroupCell")
        self.groupsCollectionvView.dataSource = self
        self.groupsCollectionvView.delegate = self
        
    }

}
extension MenuViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == groupsCollectionvView{
            return menu.groups.count
        }else{
            let group = menu.groups[selectedGroupIndex]
            return group.product.count
        }
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == groupsCollectionvView{
            let cell = groupsCollectionvView.dequeueReusableCell(withReuseIdentifier: "GroupCell", for: indexPath) as! GroupCell
            let group = menu.groups[indexPath.item]
            cell.setupCell(group: group)
            cell.layer.cornerRadius = 10
            return cell 
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
            let group = menu.groups[selectedGroupIndex]
            let product = group.product[indexPath.item]
            cell.setupCell(product: product)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == groupsCollectionvView{
            let groupName = menu.groups[indexPath.item].name
            let width = groupName.widthOfString(usingFoat: UIFont.systemFont(ofSize: 17))
            return CGSize(width: width + 20, height: collectionView.frame.height)
        }else{
            return CGSize(width: UIScreen.main.bounds.width - 10, height: UIScreen.main.bounds.width)
        }
         
        
    }
    
    //Отступ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // Промежутки между Cell в верхнем меню
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //Инсерты(чтобы при пролистовании картинки оставались по центру и не смещались)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == groupsCollectionvView{
            self.selectedGroupIndex = indexPath.item
            //после выбора Cell в верхнем меню пропадает скролл -> скроллим до начала
            self.CollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            self.CollectionView.reloadData()
            
        }
    }
}
    
