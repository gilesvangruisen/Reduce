//
//  NSArray+Reduce.h
//  Reduce
//
//  Created by Giles Van Gruisen on 2/15/15.
//  Copyright (c) 2015 Giles Van Gruisen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^ReduceBlock)(id accum, id object);
typedef BOOL (^FilterBlock)(id object);
typedef id (^MapBlock)(id object);

@interface NSArray (Reduce)

- (id)reduce:(id)initial combine:(ReduceBlock)combine;
- (NSArray *)filter:(FilterBlock)filter;
- (NSArray *)map:(MapBlock)map;

@end
