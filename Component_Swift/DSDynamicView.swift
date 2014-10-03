//
//  DSDynamicView.swift
//  DynamicScrollView
//
//  Created by Damir Stuhec on 03/10/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

import UIKit

class DSDynamicView : UIScrollView
{
    override func isEqual(object: AnyObject?) -> Bool
    {
        // override in subclass
        return super.isEqual(object)
    }
    
    func compareToObject(object: AnyObject?) -> Bool
    {
        // override in subclass
        return false
    }
}