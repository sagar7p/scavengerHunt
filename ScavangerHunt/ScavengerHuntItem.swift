//
//  ScavengerHuntItem.swift
//  ScavangerHunt
//
//  Created by Sagar Punhani on 11/6/14.
//  Copyright (c) 2014 Sagar Punhani. All rights reserved.
//

import UIKIt

class ScavengerHuntItem: NSObject, NSCoding {
    let name: String
    var photo: UIImage?
    
    let NameKey = "nameKey"
    let PhotoKey = "photoKey"
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(name, forKey: NameKey)
        
        if let thePhoto = photo {
            coder.encodeObject(thePhoto, forKey: PhotoKey)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey(NameKey) as String
        photo = aDecoder.decodeObjectForKey(PhotoKey) as? UIImage
        }
    
    var isComplete: Bool {
        get {
            return photo != nil
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
}
