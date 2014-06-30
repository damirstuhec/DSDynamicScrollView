//
//  DSDynamicView.m
//  DynamicScrollView
//
//  Created by Damir Stuhec on 29/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import "DSDynamicView.h"

@implementation DSDynamicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    // override in subclass
    return [super isEqual:object];
}

- (NSComparisonResult)compareToObject:(id)object
{
    // override in subclass
    return NSOrderedDescending;
}

@end
