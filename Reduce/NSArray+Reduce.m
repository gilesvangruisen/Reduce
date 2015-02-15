//
//  NSArray+Reduce.m
//  Reduce
//
//  Created by Giles Van Gruisen on 2/15/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

#import "NSArray+Reduce.h"

@implementation NSArray (Reduce)

- (id (^)(id, ReduceBlock))reduce
{
    return ^id (id accum, ReduceBlock combine) {
        for (id object in self) {
            accum = combine(accum, object);
        }

        return accum;
    };
}

- (NSArray *(^)(FilterBlock))filter
{
    return ^NSArray *(FilterBlock filter) {
        return [self reduce]([@[] mutableCopy], ^NSMutableArray *(NSMutableArray *accum, id object) {
            return filter(object) ? [[accum arrayByAddingObject:object] mutableCopy] : accum;
        });
    };
}

- (NSArray *(^)(MapBlock))map
{
    return ^NSArray *(MapBlock map) {
        return [self reduce]([@[] mutableCopy], ^NSMutableArray *(NSMutableArray *accum, id object) {
            return [[accum arrayByAddingObject:map(object)] mutableCopy];
        });
    };
}

@end
