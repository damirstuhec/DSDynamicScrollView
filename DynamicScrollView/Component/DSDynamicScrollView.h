//
//  DSDynamicScrollView.h
//  DynamicScrollView
//
//  Created by Damir Stuhec on 28/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSDynamicScrollView : UIScrollView

@property (nonatomic, assign) CGFloat maxNumberOfViewsPerPage;
@property (nonatomic, assign) BOOL locked;

- (void)updateViewsWithArray:(NSArray *)array;

@end
