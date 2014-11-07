//
//  ViewController.swift
//  ScavangerHunt
//
//  Created by Sagar Punhani on 11/6/14.
//  Copyright (c) 2014 Sagar Punhani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var createdItem: ScavengerHuntItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var textField: UITextField!
    

    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DoneItem" {
        
        if let name = textField.text {
            if !name.isEmpty {
                createdItem = ScavengerHuntItem(name: name)
            }
        }
        }
    }
}

