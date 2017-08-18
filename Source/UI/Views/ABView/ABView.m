//
//  ABView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABView.h"

@implementation ABView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initLoadingView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
     [self initLoadingView];
}

#pragma mark -
#pragma mark Public

- (void)showLoadingView {
    [self.loadingView setVisible:YES animated:YES];
}

- (void)hideLoadingView {
    [self.loadingView setVisible:NO animated:YES];
}

#pragma mark -
#pragma mark Private

- (void)initLoadingView {
    self.loadingView = [ABLoadingView initLoadingViewWithSuperview:self];
    
}

@end
