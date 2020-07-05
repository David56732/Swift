//
//  photoGallery.swift
//  PhotoGallery
//
//  Created by Dave on 03.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import Foundation
import UIKit


class PhotoGallery{
    var images = [UIImage]()
    
    init() {
        setupGallery()
    }
    
    
    func setupGallery(){
        
        if let myUrl1 = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/the-moon-near-side.en_.jpg"){
            if let data1 = try? Data(contentsOf: myUrl1){
                if let image1 = UIImage(data: data1){
                    self.images.append(image1)
                }
            }else{
            let image_error = UIImage(named: "error")
                self.images.append(image_error!)
                
            }
        }
                
        if let myUrl2 = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/potw2026a.jpg"){
                   if let data2 = try? Data(contentsOf: myUrl2){
                       if let image2 = UIImage(data: data2){
                           self.images.append(image2)
                       }
                   }else{
                   let image_error = UIImage(named: "error")
                       self.images.append(image_error!)
                       
                   }
               }
        
        if let myUrl3 = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/pia23900.jpg"){
                   if let data3 = try? Data(contentsOf: myUrl3){
                       if let image3 = UIImage(data: data3){
                           self.images.append(image3)
                       }
                   }else{
                   let image_error = UIImage(named: "error")
                       self.images.append(image_error!)
                       
                   }
               }
        
        if let myUrl4 = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/svalbardglacier-16.jpg"){
                   if let data4 = try? Data(contentsOf: myUrl4){
                       if let image4 = UIImage(data: data4){
                           self.images.append(image4)
                       }
                   }else{
                   let image_error = UIImage(named: "error")
                       self.images.append(image_error!)
                       
                   }
               }
    }
}
