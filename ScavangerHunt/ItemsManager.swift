//
//  ItemsManager.swift
//  ScavangerHunt
//
//  Created by Sagar Punhani on 11/7/14.
//  Copyright (c) 2014 Sagar Punhani. All rights reserved.
//

import Foundation

class ItemsManager {
    
    var items = [ScavengerHuntItem]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL]
        let documentsDirectoryURL = documentsDirectoryURLs.first!
        
        let archiveURL = documentsDirectoryURL.URLByAppendingPathComponent("ScavengerHuntItems", isDirectory: false)
        return archiveURL.path!
    }()
        func save() {
            NSKeyedArchiver.archiveRootObject(items, toFile: archivePath)
        }
        
        private func unarchiveSavedItems() {
            if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
                let savedItems = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as [ScavengerHuntItem]
                    items = savedItems
            }
        }
    
    init() {
        unarchiveSavedItems()
    }
}

    

