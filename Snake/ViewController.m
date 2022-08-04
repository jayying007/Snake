//
//  ViewController.m
//  Snake
//
//  Created by janezhuang on 2022/3/6.
//

#import "ViewController.h"
#import "GameArea.h"
#import "Snake.h"
#import "Food.h"

@interface ViewController ()
@property (nonatomic) GameArea *gameArea;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameArea = [[GameArea alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.gameArea];
    
    Snake *snake = [[Snake alloc] init];
    self.gameArea.snake = snake;
    
    Food *food = [[Food alloc] init];
    food.position = @(CGPointMake(arc4random_uniform(30), arc4random_uniform(30)));
    self.gameArea.foods = @[ food ].mutableCopy;
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
}

- (void)updateUI {
    Snake *snake = self.gameArea.snake;
    Food *food = self.gameArea.foods.firstObject;
    switch (snake.direction) {
        case Direction_Left:
            [snake moveLeft];
            break;
        case Direction_Right:
            [snake moveRight];
            break;
        case Direction_Up:
            [snake moveUp];
            break;
        case Direction_Down:
            [snake moveDown];
            break;
    }
    CGPoint head = [snake.body.firstObject CGPointValue];
    if (CGPointEqualToPoint(head, [food.position CGPointValue])) {
        [snake grow];
        while ([snake contain:food.position.CGPointValue]) {
            food.position = @(CGPointMake(arc4random_uniform(30), arc4random_uniform(30)));
        }
    }
    
    [self.gameArea setNeedsDisplay];
}
@end
