//
//  PhotosViewController.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-12.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var store : PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = photoDataSource
        collectionView.delegate = self
        
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

//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
//    {
//      //  println("User tapped on image # \(indexPath.row)")
//        
//        
//        let myImageViewPage:MyImageViewController = self.storyboard?.instantiateViewController(withIdentifier: "MyImageViewController") as! MyImageViewController
//        
//        
//        let imageHolder = self.images[indexPath.row] as! [String:AnyObject]
//        let imagePreviewString = imageHolder["preview"] as! String
//        
//        myImageViewPage.selectedImage = imagePreviewString
//        
//        self.navigationController?.pushViewController(myImageViewPage, animated: true)
//        
//    }
    
    func  collectionView(_ collectionView: UICollectionView, willDisplay cell : UICollectionViewCell, forItemAt  indexPath: IndexPath) {
        let photo = photoDataSource.photos[indexPath.row]
        
        //Download the image data
       
        store.fetchImage(for: photo){ (result) -> Void in
            
            guard let photoIndex = self.photoDataSource.photos.index(of: photo),
                case let .success(image) = result else {
                    return
            }
            
            let photoIndexPath = IndexPath(item: photoIndex, section: 0)
            
            if let cell = self.collectionView.cellForItem(at: photoIndexPath) as? PhotoCollectionViewCell {
                cell.update(with: image)
            }
            
    }
    }
}
