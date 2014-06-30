//
//  DSDynamicScrollView.m
//  DynamicScrollView
//
//  Created by Damir Stuhec on 28/06/14.
//  Copyright (c) 2014 damirstuhec. All rights reserved.
//

#import "DSDynamicScrollView.h"
#import "DSDynamicView.h"

#define DEFAULT_MARGIN 15.0f
#define SMALL_MARGIN 7.0f
#define MAX_NUMBER_OF_VIEWS_PER_PAGE 5

@interface DSDynamicScrollView()

@property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, assign) CGSize viewSize;

@end

@implementation DSDynamicScrollView

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.views = NSMutableArray.new;
        self.maxNumberOfViewsPerPage = MAX_NUMBER_OF_VIEWS_PER_PAGE;
    }
    return self;
}

#pragma mark - Public methods

- (void)updateViewsWithArray:(NSArray *)array
{
    if (!self.locked)
    {
        NSMutableArray *viewsToKeep = NSMutableArray.new;
        NSMutableArray *viewsToAdd = NSMutableArray.new;
        NSMutableArray *viewsToRemove = [self.views mutableCopy];
        
        for (UIView *view in array)
        {
            if ([viewsToRemove containsObject:view])
            {
                [viewsToRemove removeObject:view];
                [viewsToKeep addObject:view];
            }
            else
            {
                [viewsToAdd addObject:view];
            }
        }
        
        self.views = [[NSMutableArray alloc] initWithArray:array];
        self.views = [[self.views sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            return [(DSDynamicView *)obj1 compareToObject:obj2];
        }] mutableCopy];
        
        [self calculateViewSize];
        
        [self updateRemovingViews:viewsToRemove withAnimation:YES completion:^{
            [self repositionKeepingViews:viewsToKeep withAnimation:YES completion:^{
                [self updateAddingViews:viewsToAdd withAnimation:YES completion:nil];
            }];
        }];
        
        self.contentSize = CGSizeMake(self.frame.size.width, self.views.count * (self.viewSize.height + DEFAULT_MARGIN));
    }
}

#pragma mark - Helper methods

- (void)updateRemovingViews:(NSArray *)viewsToRemove withAnimation:(BOOL)animation completion:(void(^)())completion
{
    if (viewsToRemove.count == 0)
    {
        if (completion) completion();
        return;
    }
    
    __block NSInteger counter = 0;
    
    for (UIView *viewToRemove in viewsToRemove)
    {
        [UIView animateWithDuration:((animation) ? 0.2f : 0.0f) animations:^{
            viewToRemove.frame = CGRectMake(320.0f, viewToRemove.frame.origin.y, viewToRemove.frame.size.width, viewToRemove.frame.size.height);
        } completion:^(BOOL finished) {
            [viewToRemove removeFromSuperview];
            
            counter++;
            if (counter == viewsToRemove.count)
            {
                if (completion) completion();
            }
        }];
    }
}

- (void)repositionKeepingViews:(NSArray *)viewsToKeep withAnimation:(BOOL)animation completion:(void(^)())completion
{
    if (viewsToKeep.count == 0)
    {
        if (completion) completion();
        return;
    }
    
    __block NSInteger counter = 0;
    
    for (UIView *viewToKeep in viewsToKeep)
    {
        NSInteger viewToKeepIndex = [self.views indexOfObject:viewToKeep];
        CGFloat viewToKeepY = viewToKeepIndex * (self.viewSize.height + DEFAULT_MARGIN);
        
        [UIView animateWithDuration:((animation) ? 0.2f : 0.0f) animations:^{
            viewToKeep.frame = CGRectMake(viewToKeep.frame.origin.x, viewToKeepY, self.viewSize.width, self.viewSize.height);
        } completion:^(BOOL finished) {
            
            counter++;
            if (counter == viewsToKeep.count)
            {
                if (completion) completion();
            }
        }];
    }
}

- (void)updateAddingViews:(NSArray *)viewsToAdd withAnimation:(BOOL)animation completion:(void(^)())completion
{
    if (viewsToAdd.count == 0)
    {
        if (completion) completion();
        return;
    }
    
    __block NSInteger counter = 0;
    
    for (UIView *viewToAdd in viewsToAdd)
    {
        CGFloat hue = ( arc4random() % 256 / 256.0 );
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
        
        viewToAdd.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        viewToAdd.frame = CGRectMake(-320.0f, [self.views indexOfObject:viewToAdd] * (self.viewSize.height + DEFAULT_MARGIN), self.viewSize.width, self.viewSize.height);
        
        [self addSubview:viewToAdd];
        
        [UIView animateWithDuration:((animation) ? 0.2f : 0.0f) animations:^{
            viewToAdd.frame = CGRectMake(0.0f, viewToAdd.frame.origin.y, viewToAdd.frame.size.width, viewToAdd.frame.size.height);
        } completion:^(BOOL finished) {
            
            counter++;
            if (counter == viewsToAdd.count)
            {
                if (completion) completion();
            }
        }];
    }
}

- (void)calculateViewSize
{
    NSInteger viewsCountWithLimit = (self.views.count > self.maxNumberOfViewsPerPage) ? self.maxNumberOfViewsPerPage : self.views.count;
    self.viewSize = CGSizeMake(self.frame.size.width, (self.frame.size.height - ((viewsCountWithLimit - 1) * DEFAULT_MARGIN)) / viewsCountWithLimit);
}

@end
