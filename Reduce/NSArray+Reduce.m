//
//  NSArray+Reduce.m
//  Reduce
//
//  Created by Giles Van Gruisen on 2/15/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

#import "Reduce.h"

@implementation NSArray (Reduce)

- (id)reduce:(id)initial combine:(ReduceBlock)combine
{
    for (id object in self) {
        initial = combine(initial, object);
    }

    return initial;
}

- (NSArray *)filter:(FilterBlock)filter
{
    return [self reduce:[@[] mutableCopy] combine: ^NSMutableArray *(NSMutableArray *accum, id object) {
        return filter(object) ? [[accum arrayByAddingObject:object] mutableCopy] : accum;
    }];
}

- (NSArray *)map:(MapBlock)map
{
    return [self reduce:[@[] mutableCopy] combine: ^NSMutableArray *(NSMutableArray *accum, id object) {
        return [[accum arrayByAddingObject:map(object)] mutableCopy];
    }];
}

@end
