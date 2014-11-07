//
//  ListViewController.swift
//  ScavangerHunt
//
//  Created by Sagar Punhani on 11/6/14.
//  Copyright (c) 2014 Sagar Punhani. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var itemsManager = ItemsManager()
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = .Camera
        } else {
            imagePicker.sourceType = .PhotoLibrary
        }
        
        imagePicker.delegate = self
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        let indexPath = tableView.indexPathForSelectedRow()!
        let selectedItem = itemsManager.items[indexPath.row]
        
        let photo = info[UIImagePickerControllerOriginalImage] as UIImage
        selectedItem.photo = photo
        
        dismissViewControllerAnimated(true, completion: {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
            self.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation:.Automatic)
        })
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsManager.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as UITableViewCell
        
            let item = itemsManager.items[indexPath.row]
            cell.textLabel.text = item.name
        
        if(item.isComplete) {
            cell.accessoryType = .Checkmark
            cell.imageView.image = item.photo
            itemsManager.save()
        }
        
        else {
            cell.accessoryType = .None
            cell.imageView.image = nil
        }
        
       
        return cell
    }
    
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        
        if segue.identifier == "DoneItem" {
            let addItemController = segue.sourceViewController as ViewController
            
            if let newItem = addItemController.createdItem {
                
              
                itemsManager.items += [newItem]
                itemsManager.save()
                
                let indexPath = NSIndexPath(forItem: itemsManager.items.count - 1, inSection: 0)
                
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                }
                
            
        }
        
    }
}

