//
//  GameArea.m
//  Snake
//
//  Created by janezhuang on 2022/3/6.
//

#import "GameArea.h"
#import "GameCommon.h"

@implementation GameArea {
    CGPoint startPoint;
    CGPoint endPoint;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGMutablePathRef path1 = CGPathCreateMutable();
    CGMutablePathRef path2 = CGPathCreateMutable();
    //Snake
    CGContextSetFillColorWithColor(context, UIColor.greenColor.CGColor);
    for (NSValue *value in self.snake.body) {
        CGPoint point = [value CGPointValue];
        CGPathAddRect(path1, 0, CGRectMake(point.x * LEN, point.y * LEN, LEN, LEN));
    }
    CGContextAddPath(context, path1);
    //Food
    CGContextSetFillColorWithColor(context, UIColor.redColor.CGColor);
    for (Food *food in self.foods) {
        CGPoint point = [food.position CGPointValue];
        CGPathAddRect(path2, 0, CGRectMake(point.x * LEN, point.y * LEN, LEN, LEN));
    }
    CGContextAddPath(context, path2);
    
    CGContextFillPath(context);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    startPoint = [touch locationInView:self];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    endPoint = [touch locationInView:self];
    
    UInt32 xOffset = ABS(endPoint.x - startPoint.x);
    UInt32 yOffset = ABS(endPoint.y - startPoint.y);
    if (xOffset > yOffset) {
        if (endPoint.x > startPoint.x) {
            [self.snake setDirection:Direction_Right];
        } else {
            [self.snake setDirection:Direction_Left];
        }
    } else {
        if (endPoint.y > startPoint.y) {
            [self.snake setDirection:Direction_Down];
        } else {
            [self.snake setDirection:Direction_Up];
        }
    }
}
@end
