//
//  ViewHome.swift
//  NVHboutique
//
//  Created by Hùng Nguyễn  on 8/17/16.
//  Copyright © 2016 MobileSoftware. All rights reserved.
//

import UIKit

class ViewHome: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        
        var myDict: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
        {
            myDict = NSDictionary(contentsOfFile: path)
        }
        
        for dic in myDict!.allValues {
                        print(dic["name"])
                        print(dic["content"])
                        print(dic["images"])
                        print(dic["price"])
            
            items.append(Item(name: dic["name"] as! String, content: dic["content"] as! String, nameImages: dic["images"] as! NSArray as! [String], price: dic["price"] as! String))
        }
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        let img = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        
        img.image = UIImage(named: items[indexPath.item].nameImages[0]+".jpg")
        
    
        img.contentMode = .ScaleAspectFit
        
        cell.contentView.addSubview(img)
        
        
        return cell
        
        
    }
    
    
    
}
