//
//  LicentiaVenueView.h
//  DynamicScrollView
//
//  Created by Damir Stuhec on 29/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import "DSDynamicView.h"

@interface ExampleView : DSDynamicView

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, assign) NSInteger uniqueNumber;
@property (nonatomic, assign) NSInteger distance;

- (id)initWithFrame:(CGRect)frame name:(NSString *)name;

@end
