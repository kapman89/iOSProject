//
//  ABArrayModelChange.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABArrayModel.h"

@class ABArrayModelChangeAdd;
@class ABArrayModelChangeRemove;
@class ABArrayModelChangeMove;

@interface ABArrayModelChange : NSObject

+ (instancetype)modelChangeAddWithIndex:(NSUInteger)index;
+ (instancetype)modelChangeDeleteWithIndex:(NSUInteger)index;
+ (instancetype)modelChangeMoveAtIndex:(NSUInteger)sourceIndex
                               toIndex:(NSUInteger)destinationIndex;
@end

@interface ABArrayModelChange (UITableView)

- (void)updateTableView:(UITableView *)tableView;
- (void)updateTableView:(UITableView *)tableView
            inSection:(NSUInteger)section;
- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
       withRowAnimation:(UITableViewRowAnimation)animation;

@end

