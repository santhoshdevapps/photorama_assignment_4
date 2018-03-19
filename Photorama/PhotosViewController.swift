//
//  PhotosViewController.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-12.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var store : PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = photoDataSource
        
        store.fetchInterstingPhotos{
            (photosResult)  -> Void in
            switch photosResult{
            case let .success(photos): print("successfully found \(photos.count) photos.")
            
           self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos:  \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
            
        }
        
    }

//    func updateImageView(for photo: Photo){
//        store.fetchImage(for: photo){
//            (imageResult) -> Void in
//
//            switch imageResult {
//            case let .success(image):
//                self.imageView.image = image
//            case let .failure(error):
//                print("Error downloading image: \(error)")
//            }
//        }
//    }

}
