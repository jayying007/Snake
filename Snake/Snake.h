//
//  Snake.h
//  Snake
//
//  Created by janezhuang on 2022/3/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(UInt8, Direction) {
    Direction_Left = 1,
    Direction_Right = 2,
    Direction_Up = 3,
    Direction_Down = 4,
};

@interface Snake : NSObject

@property (nonatomic) Direction direction;
//身体是一个point数组
@property (nonatomic) NSMutableArray<NSValue *> *body;

- (void)moveLeft;
- (void)moveRight;
- (void)moveUp;
- (void)moveDown;

- (void)grow;
- (BOOL)contain:(CGPoint)point;

@end
