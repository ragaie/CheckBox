//
//  ViewController.swift
//  CheckBox
//
//  Created by Ragaie alfy on 11/16/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CheckBoxDelegate{
    func CheckBox(_ checkBox: CheckBox) {
        
        
        
       print( checkBox.checked)
    }
    

    
    @IBOutlet weak var checkOne: CheckBox!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        checkOne.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

