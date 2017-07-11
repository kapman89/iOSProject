//
//  ABSquereView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ABSquerePosition) {
    ABSquerePositionTopLeft,
    ABSquerePositionTopRight,
    ABSquerePositionBottomRight,
    ABSquerePositionBottomLeft
};

@interface ABSquereView : UIView
@property (nonatomic, strong)   IBOutlet UIView *squere;

@end
