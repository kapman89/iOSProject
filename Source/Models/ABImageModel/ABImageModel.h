//
//  ABImageModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABModel.h"

@interface ABImageModel : ABModel <ABModelSaveAndDump>
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) NSURL   *url;

+ (instancetype)imageWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;
- (void)performLoading;
- (void)dumpModel;

// Method created for overriding, do not call it directly
- (UIImage *)loadImage;

@end
