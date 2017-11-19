//
//  ViewController.swift
//  CheckBox
//
//  Created by Ragaie alfy on 11/16/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,CheckBoxDelegate,RadioGroupDelegate{
    
    func CheckBox(_ checkBox: CheckBox) {
        
        
        
       print( checkBox.checked)
    }
    

    
    @IBOutlet weak var checkOne: CheckBox!
    
    
    @IBOutlet weak var radioGroupData: RadioGroup!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        checkOne.delegate = self
        
        radioGroupData.delegate = self
        radioGroupData.dataSource = ["first","secand","third one"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func radioGroup(_ radioGroup: RadioGroup, selectIndex: Int) {
        
        print(selectIndex)
        
    }

}

