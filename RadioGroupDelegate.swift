//
//  RadioGroupDelegate.swift
//  CheckBox
//
//  Created by Ragaie alfy on 11/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import Foundation
public protocol RadioGroupDelegate {
    
    
    func radioGroup(_ radioGroup: RadioGroup, selectIndex : Int)
    func radioGroup(_ radioGroup: RadioGroup, deSelectIndex : Int)

}
