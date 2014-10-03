//
//  ViewController.swift
//  DynamicScrollView
//
//  Created by Damir Stuhec on 03/10/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var scrollView: DSDynamicScrollView
    var v1 = ExampleView(frame: CGRectZero, name: "View 1")
    var v2 = ExampleView(frame: CGRectZero, name: "View 2")
    var v3 = ExampleView(frame: CGRectZero, name: "View 3")
    var v4 = ExampleView(frame: CGRectZero, name: "View 4")
    var v5 = ExampleView(frame: CGRectZero, name: "View 5")
    var v6 = ExampleView(frame: CGRectZero, name: "View 6")
    var v7 = ExampleView(frame: CGRectZero, name: "View 7")
    var v8 = ExampleView(frame: CGRectZero, name: "View 8")
    var v9 = ExampleView(frame: CGRectZero, name: "View 9")
    var v10 = ExampleView(frame: CGRectZero, name: "View 10")
    var v11 = ExampleView(frame: CGRectZero, name: "View 11")
    var v12 = ExampleView(frame: CGRectZero, name: "View 12")
    var v13 = ExampleView(frame: CGRectZero, name: "View 13")
    var v14 = ExampleView(frame: CGRectZero, name: "View 14")
    var v15 = ExampleView(frame: CGRectZero, name: "View 15")
    var v16 = ExampleView(frame: CGRectZero, name: "View 16")
    var v17 = ExampleView(frame: CGRectZero, name: "View 17")
    
    required init(coder aDecoder: NSCoder)
    {
        self.scrollView = DSDynamicScrollView(frame: CGRectZero)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.scrollView = DSDynamicScrollView(frame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height));
        self.view.addSubview(self.scrollView)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v1.uniqueNumber = 1
            self.v1.distance = 10
            self.v2.uniqueNumber = 2
            self.v2.distance = 20
            
            self.scrollView.updateViewsWithArray([self.v1, self.v2])
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v3.uniqueNumber = 3
            self.v3.distance = 30
            
            self.scrollView.updateViewsWithArray([self.v2])
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v4.uniqueNumber = 4
            self.v4.distance = 4
            self.v5.uniqueNumber = 5
            self.v5.distance = 15
            self.v6.uniqueNumber = 6
            self.v6.distance = 25
            self.v7.uniqueNumber = 7
            self.v7.distance = 70
            
            self.scrollView.updateViewsWithArray([self.v4, self.v5, self.v6, self.v2])
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v8.uniqueNumber = 8;
            self.v8.distance = 80;
            self.v9.uniqueNumber = 9;
            self.v9.distance = 90;
            self.v10.uniqueNumber = 10;
            self.v10.distance = 100;
            
            self.scrollView.updateViewsWithArray([self.v8, self.v2, self.v5])
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v11.uniqueNumber = 11;
            self.v11.distance = 110;
            self.v12.uniqueNumber = 12;
            self.v12.distance = 120;
            
            self.scrollView.updateViewsWithArray([self.v5, self.v12])
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
            self.v13.uniqueNumber = 13;
            self.v13.distance = 130;
            self.v14.uniqueNumber = 14;
            self.v14.distance = 140;
            self.v15.uniqueNumber = 15;
            self.v15.distance = 150;
            self.v16.uniqueNumber = 16;
            self.v16.distance = 160;
            self.v17.uniqueNumber = 17;
            self.v17.distance = 170;
            
            self.scrollView.updateViewsWithArray([self.v13, self.v14, self.v15, self.v16, self.v12])
        })
    }
}
