//
//  Photo.swift
//  Photorama
//
//  Created by santhosh damodharan on 2018-03-12.
//  Copyright © 2018 santhosh damodharan. All rights reserved.
//

import Foundation

class Photo: Equatable{
    
    let title: String
    let remoteURL: URL
    let photoID : String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        
        self.title = title
        self.photoID = photoID  
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
        
    }
    
    static func == (lhs: Photo, rhs: Photo) -> Bool{
        
        return lhs.photoID == rhs.photoID
    }
  
}

//extension Photo: Equatable {
//    static func == (lhs: Photo, rhs: Photo) -> Bool{
//        
//        return lhs.photoID == rhs.photoID
//    }
//}
    

