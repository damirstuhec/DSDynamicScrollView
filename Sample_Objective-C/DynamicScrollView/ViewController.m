//
//  ViewController.m
//  DynamicScrollView
//
//  Created by Damir Stuhec on 28/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import "ViewController.h"
#import "DSDynamicScrollView.h"
#import "ExampleView.h"

@interface ViewController ()

@property (nonatomic, strong) DSDynamicScrollView *scrollView;
@property (nonatomic, strong) ExampleView *v1;
@property (nonatomic, strong) ExampleView *v2;
@property (nonatomic, strong) ExampleView *v3;
@property (nonatomic, strong) ExampleView *v4;
@property (nonatomic, strong) ExampleView *v5;
@property (nonatomic, strong) ExampleView *v6;
@property (nonatomic, strong) ExampleView *v7;
@property (nonatomic, strong) ExampleView *v8;
@property (nonatomic, strong) ExampleView *v9;
@property (nonatomic, strong) ExampleView *v10;
@property (nonatomic, strong) ExampleView *v11;
@property (nonatomic, strong) ExampleView *v12;
@property (nonatomic, strong) ExampleView *v13;
@property (nonatomic, strong) ExampleView *v14;
@property (nonatomic, strong) ExampleView *v15;
@property (nonatomic, strong) ExampleView *v16;
@property (nonatomic, strong) ExampleView *v17;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollView = [[DSDynamicScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.scrollView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.v1 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 1"];
    self.v2 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 2"];
    self.v3 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 3"];
    self.v4 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 4"];
    self.v5 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 5"];
    self.v6 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 6"];
    self.v7 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 7"];
    self.v8 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 8"];
    self.v9 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 9"];
    self.v10 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 10"];
    self.v11 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 11"];
    self.v12 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 12"];
    self.v13 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 13"];
    self.v14 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 14"];
    self.v15 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 15"];
    self.v16 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 16"];
    self.v17 = [[ExampleView alloc] initWithFrame:CGRectZero name:@"View 17"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.v1.uniqueNumber = 1;
        self.v1.distance = 10;
        self.v2.uniqueNumber = 2;
        self.v2.distance = 20;
        
        [self.scrollView updateViewsWithArray:@[self.v1, self.v2]];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.v3.uniqueNumber = 3;
        self.v3.distance = 30;
        
        [self.scrollView updateViewsWithArray:@[self.v2]];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 6 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.v4.uniqueNumber = 4;
        self.v4.distance = 4;
        self.v5.uniqueNumber = 5;
        self.v5.distance = 15;
        self.v6.uniqueNumber = 6;
        self.v6.distance = 25;
        self.v7.uniqueNumber = 7;
        self.v7.distance = 70;
        
        [self.scrollView updateViewsWithArray:@[self.v4, self.v5, self.v6, self.v2]];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 8 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.v8.uniqueNumber = 8;
        self.v8.distance = 80;
        self.v9.uniqueNumber = 9;
        self.v9.distance = 90;
        self.v10.uniqueNumber = 10;
        self.v10.distance = 100;
        
        [self.scrollView updateViewsWithArray:@[self.v8, self.v2, self.v5]];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.v11.uniqueNumber = 11;
        self.v11.distance = 110;
        self.v12.uniqueNumber = 12;
        self.v12.distance = 120;
        
        [self.scrollView updateViewsWithArray:@[self.v5, self.v12]];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 12 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
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
        
        [self.scrollView updateViewsWithArray:@[self.v13, self.v14, self.v15, self.v16, self.v12]];
    });
}

@end
