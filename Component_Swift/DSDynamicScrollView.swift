//
//  DSDynamicScrollView.swift
//  DynamicScrollView
//
//  Created by Damir Stuhec on 03/10/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

import UIKit

class DSDynamicScrollView : UIScrollView
{
    let defaultMargin: CGFloat = 15.0
    let smallMargin: CGFloat = 7.0
    
    var maxNumberOfViewsPerPage: Int = 5
    var locked: Bool = false
    var views = [DSDynamicView]()
    var viewSize: CGSize = CGSizeZero
    
    func updateViewsWithArray(var array: [DSDynamicView])
    {
        if !self.locked
        {
            var viewsToKeep = [DSDynamicView]()
            var viewsToAdd = [DSDynamicView]()
            var viewsToRemove = self.views
            
            for aView in array
            {
                if contains(viewsToRemove, aView)
                {
                    if let index = find(viewsToRemove, aView)
                    {
                        viewsToRemove.removeAtIndex(index)
                    }
                    
                    viewsToKeep.append(aView as DSDynamicView)
                }
                else
                {
                    viewsToAdd.append(aView as DSDynamicView)
                }
            }
            
            self.views = sorted(array) {
                (obj1: DSDynamicView, obj2: DSDynamicView) -> Bool in
                return obj1.compareToObject(obj2)
            }
            
            self.calculateViewSize()
            
            self.updateRemovingViewsWithAnimation(viewsToRemove, animation:true, completionHandler: { () -> Void in
                self.repositionKeepingViewsWithAnimation(viewsToKeep, animation:true, completionHandler: { () -> Void in
                    self.updateAddingViewsWithAnimation(viewsToAdd, animation:true, completionHandler: { () -> Void in
                    })
                })
            })
        }
    }
    
    // MARK: Helper methods
    
    func updateRemovingViewsWithAnimation(var removingViews: [DSDynamicView], let animation: Bool, completionHandler:() -> Void)
    {
        if removingViews.count == 0
        {
            completionHandler()
            return
        }
        
        var counter = 0
        
        for aView in removingViews
        {
            UIView.animateWithDuration((animation) ? 0.2 : 0.0, animations: { () -> Void in
                aView.frame = CGRectMake(320.0, aView.frame.origin.y, aView.frame.size.width, aView.frame.size.height)
                }, completion: { (finished) -> Void in
                    aView.removeFromSuperview()
                    counter++
                
                    if counter == removingViews.count
                    {
                        completionHandler()
                    }
            })
        }
    }
    
    func repositionKeepingViewsWithAnimation(var keepingViews: [DSDynamicView], let animation: Bool, completionHandler:() -> Void)
    {
        if keepingViews.count == 0
        {
            completionHandler()
            return
        }
        
        var counter = 0
        
        for aView in keepingViews
        {
            let viewIndex = CGFloat(find(self.views, aView)!)
            let viewY = viewIndex * (self.viewSize.height + self.defaultMargin)
            
            UIView.animateWithDuration((animation) ? 0.2 : 0.0, animations: { () -> Void in
                aView.frame = CGRectMake(aView.frame.origin.x, viewY, self.viewSize.width, self.viewSize.height)
                }, completion: { (finished) -> Void in
                    counter++
                    
                    if counter == keepingViews.count
                    {
                        completionHandler()
                    }
            })
        }
    }
    
    func updateAddingViewsWithAnimation(var addingViews: [DSDynamicView], let animation: Bool, completionHandler:() -> Void)
    {
        if addingViews.count == 0
        {
            completionHandler()
            return
        }
        
        var counter = 0
        
        for aView in addingViews
        {
            let viewIndex = CGFloat(find(self.views, aView)!)
            let viewY = viewIndex * (self.viewSize.height + self.defaultMargin)
            
            aView.frame = CGRectMake(-320.0, viewY, self.viewSize.width, self.viewSize.height)
            self.addSubview(aView)
            
            UIView.animateWithDuration((animation) ? 0.2 : 0.0, animations: { () -> Void in
                aView.frame = CGRectMake(0.0, aView.frame.origin.y, aView.frame.size.width, aView.frame.size.height)
                }, completion: { (finished) -> Void in
                    counter++
                    
                    if counter == addingViews.count
                    {
                        completionHandler()
                    }
            })
        }
    }
    
    func calculateViewSize()
    {
        let viewsCountWithLimit = (self.views.count > maxNumberOfViewsPerPage) ? maxNumberOfViewsPerPage : self.views.count
        self.viewSize = CGSizeMake(self.frame.size.width, (self.frame.size.height - self.contentInset.top - self.contentInset.bottom - ((CGFloat(viewsCountWithLimit) - 1) * self.defaultMargin)) / CGFloat(viewsCountWithLimit))
    }
}
