//
//  Snake.m
//  Snake
//
//  Created by janezhuang on 2022/3/6.
//

#import "Snake.h"
#import "GameCommon.h"

@implementation Snake

- (instancetype)init {
    self = [super init];
    if (self) {
        self.direction = Direction_Right;
        self.body = @[ @(CGPointMake(6, 5)), @(CGPointMake(5, 5)), @(CGPointMake(4
                        , 5)), @(CGPointMake(3, 5)) ].mutableCopy;
    }
    return self;
}

- (void)moveLeft {
    if (self.direction == Direction_Right) {
        return;
    }
    self.direction = Direction_Left;
    
    CGPoint head = [self.body.firstObject CGPointValue];
    [self.body insertObject:@(CGPointMake(head.x - 1, head.y)) atIndex:0];
    [self.body removeLastObject];
}

- (void)moveRight {
    if (self.direction == Direction_Left) {
        return;
    }
    self.direction = Direction_Right;
    
    CGPoint head = [self.body.firstObject CGPointValue];
    [self.body insertObject:@(CGPointMake(head.x + 1, head.y)) atIndex:0];
    [self.body removeLastObject];
}

- (void)moveUp {
    if (self.direction == Direction_Down) {
        return;
    }
    self.direction = Direction_Up;
    
    CGPoint head = [self.body.firstObject CGPointValue];
    [self.body insertObject:@(CGPointMake(head.x, head.y - 1)) atIndex:0];
    [self.body removeLastObject];
}

- (void)moveDown {
    if (self.direction == Direction_Up) {
        return;
    }
    self.direction = Direction_Down;
    
    CGPoint head = [self.body.firstObject CGPointValue];
    [self.body insertObject:@(CGPointMake(head.x, head.y + 1)) atIndex:0];
    [self.body removeLastObject];
}

- (void)grow {
    CGPoint head = [self.body.firstObject CGPointValue];
    if (self.direction == Direction_Up) {
        [self.body insertObject:@(CGPointMake(head.x, head.y - 1)) atIndex:0];
    }
    if (self.direction == Direction_Down) {
        [self.body insertObject:@(CGPointMake(head.x, head.y + 1)) atIndex:0];
    }
    if (self.direction == Direction_Left) {
        [self.body insertObject:@(CGPointMake(head.x - 1, head.y)) atIndex:0];
    }
    if (self.direction == Direction_Right) {
        [self.body insertObject:@(CGPointMake(head.x + 1, head.y)) atIndex:0];
    }
}

- (BOOL)contain:(CGPoint)point {
    for (NSValue *value in self.body) {
        if (CGPointEqualToPoint(point, [value CGPointValue])) {
            return YES;
        }
    }
    return NO;
}
@end
