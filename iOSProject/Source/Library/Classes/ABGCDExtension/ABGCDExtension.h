//
//  ABGCDExtension.h
//  IDAPCourse
//
//  Created by Andrew Boychuk on 7/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ABConditionBlock)(void);

@interface ABGCDExtension : NSObject

dispatch_queue_t ABQueueSerial(void);
dispatch_queue_t ABQueueConcurrent(void);

dispatch_queue_t ABQueueWithQOSClass(long cls);
dispatch_queue_t ABBackgroundQueue(void);
dispatch_queue_t ABMainQueue(void);

void ABDispatchSyncOnMainThread(dispatch_block_t block);
void ABDispatchAsyncOnMainThread(dispatch_block_t block);
void ABDispatchAsyncInBackgroundThread(dispatch_block_t block);
void ABDispatchSyncInBackgroundThread(dispatch_block_t block);

void ABDispatchAfterDelay(NSUInteger delay, dispatch_block_t block);
void ABDispatchAfterDelayWithCondition(NSUInteger delay, dispatch_block_t block, ABConditionBlock conditionBlock);

@end
