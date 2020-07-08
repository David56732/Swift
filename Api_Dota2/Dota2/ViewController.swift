//
//  ViewController.swift
//  Dota2
//
//  Created by Dave on 07.07.2020.
//  Copyright © 2020 Dave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var DotaView: UICollectionView!
    
    var heroes = [Hero]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DotaView.register(UINib(nibName: "DotaCell", bundle: nil) , forCellWithReuseIdentifier: "dotaCell")
        self.DotaView.dataSource = self
        self.DotaView.delegate = self
        
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else { return }
              let session = URLSession.shared
              session.dataTask(with: url) { (data, response, error) in
                  if let response = response{
                      print(response)
                  }
                  guard let data = data else { return }
                  print(data)
                  do{
                      self.heroes = try JSONDecoder().decode([Hero].self, from: data)
                  }catch{
                      print(error)
                  }
                  DispatchQueue.main.async {
                    self.DotaView.reloadData()
                  }
              }.resume()
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

    
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DotaView.dequeueReusableCell(withReuseIdentifier: "dotaCell", for: indexPath) as! DotaCell
        
        cell.labelField.text = heroes[indexPath.item].localized_name
        
        let defaultLink = "https://api.opendota.com"
        let completeLink = defaultLink + heroes[indexPath.item].img
        cell.imageField.clipsToBounds = true
        cell.imageField.layer.cornerRadius = cell.imageField.frame.height / 2
        cell.imageField.downloaded(from: completeLink)
        cell.imageField.contentMode = .scaleAspectFill
        return cell
    }
    
        
    }

   
    


