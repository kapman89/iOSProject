//
//  ABFBViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABUser.h"
#import "ABFBCurrentUser.h"
#import "ABContext.h"

#import "ABMacro.h"
#import "ABGCDExtension.h"

@interface ABFBViewController : UIViewController <ABModelObserver>
@property (nonatomic, strong)   id              model;
@property (nonatomic, strong)   ABContext       *context;
@property (nonatomic, strong)   ABFBCurrentUser *currentUser;

- (void)updateViewWithModel:(id)model;

@end
