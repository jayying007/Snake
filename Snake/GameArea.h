//
//  GameArea.h
//  Snake
//
//  Created by janezhuang on 2022/3/6.
//

#import <UIKit/UIKit.h>
#import "Snake.h"
#import "Food.h"

@interface GameArea : UIView

@property (nonatomic) Snake *snake;
@property (nonatomic) NSMutableArray<Food *> *foods;

@end

