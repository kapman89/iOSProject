//
//  ABArrayModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/27/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

#import "NSMutableArray+ABExtension.h"

@interface ABArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableObjects;

- (void)notifyOfStateWithModelChange:(ABArrayModelChange *)modelChange;

@end

@implementation ABArrayModel

@dynamic count;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray new];
    }
    
    return self;
}

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.mutableObjects = [NSMutableArray arrayWithArray:objects];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    @synchronized (self) {
        return self.mutableObjects.count;
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)addObject:(id)object {
    [self insertObject:object atIndex:self.count];
}

- (void)addObjects:(id)objects {
    for (id object in objects) {
        [self addObject:object];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        if (object) {
            if (index < self.count) {
                [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeAddWithIndex:index]];
                [self.mutableObjects insertObject:object atIndex:index];
            }
        }
    }
}

- (void)removeObject:(id)object {
    [self removeObjectAtIndex:[self indexOfObject:object]];
}

- (void)removeObjects:(id)objects {
    for (id object in objects) {
        [self removeObject:object];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        if (index < self.count) {
            [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeDeleteWithIndex:index]];
            [self.mutableObjects removeObjectAtIndex:index];
        }
    }
}

- (void)moveObjectFromIndex:(NSUInteger)sourceIndex toIndex:(NSUInteger)destinationIndex {
    @synchronized (self) {
        [self notifyOfStateWithModelChange:[ABArrayModelChange modelChangeMoveAtIndex:sourceIndex
                                                                              toIndex:destinationIndex]];
        [self.mutableObjects moveObjectAtIndex:sourceIndex toIndex:destinationIndex];
    }
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return index < self.count ? self.mutableObjects[index] : nil;
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)object {
    return [self.mutableObjects indexOfObject:object];
}

- (void)notifyOfStateWithModelChange:(ABArrayModelChange *)modelChange {
    [self notifyOfState:ABArrayModelObjectChanged withObject:modelChange];
}

#pragma mark -
#pragma mark Observable Object

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ABArrayModelObjectChanged:
            return @selector(arrayModel:didChangeWithArrayModelChange:);
    }
    
    return nil;
}


@end
