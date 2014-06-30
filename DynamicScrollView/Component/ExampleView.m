//
//  LicentiaVenueView.m
//  DynamicScrollView
//
//  Created by Damir Stuhec on 29/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import "ExampleView.h"

@implementation ExampleView

- (id)initWithFrame:(CGRect)frame name:(NSString *)name
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:frame];
        self.nameLabel.text = name;
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        [self addSubview:self.nameLabel];
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    ExampleView *anotherView = ([object isKindOfClass:[ExampleView class]]) ? (ExampleView *)object : nil;
    return self.uniqueNumber == anotherView.uniqueNumber;
}

- (NSComparisonResult)compareToObject:(id)object
{
    ExampleView *anotherView = ([object isKindOfClass:[ExampleView class]]) ? (ExampleView *)object : nil;
    
    if (self.distance > anotherView.distance)
    {
        return NSOrderedDescending;
    }
    else
    {
        return NSOrderedAscending;
    }
}

@end
