//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-19.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import Foundation
import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
    
    
    var photos = [Photo]()
    
}
