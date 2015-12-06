//
//  ViewController.m
//  RunningLed
//
//  Created by Duy Dang on 12/5/15.
//  Copyright © 2015 Duy Dang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    CGFloat _margin; //> ball radius
    int _numberOfBall;
    CGFloat _space; //> bal diameter
    CGFloat _ballDiameter;
    NSTimer* _timer;
    int i;
    int j;
    
}


- (void)viewDidLoad {
    _margin = 40.0;
    _ballDiameter = 24.0;
    [super viewDidLoad];
    [self checkSizeOfApp];
    [self numberOfBallvsSpace];
    [self drawRowOfBalls:8];
    
    //_timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLed) userInfo:nil repeats:true];
    

}
- (void) runningLed {
    NSLog(@"Hi");
}

- (void) placeGrayBallAtX: (CGFloat) x
                     andY: (CGFloat) y
                  withTag: (int)tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"green"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [self.view addSubview:ball];
    //NSLog(@"w = %3.0f, h = % 3.0f", ball.bounds.size.width, ball.bounds.size.height);
}
- (CGFloat) spaceBetweenBallCenterWhenNumberBallIsKnown: (int) n {
    return (self.view.bounds.size.width - 2 * _margin) / (n - 1);
    //return (self.view.bounds.size.height - 2 * _margin) / (n - 1);
}

- (void) numberOfBallvsSpace {
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown: n];
        if (space < _ballDiameter) {
            stop = true;
            
        }
        else{
            NSLog(@"Number of ball %d, space between ball center %3.0f", n, space);
            }
        n++;
     }
    
}
- (void) drawRowOfBalls: (int) numberBall {
    CGFloat space = [self spaceBetweenBallCenterWhenNumberBallIsKnown:numberBall];
    for (i = 0; i < numberBall; i++) {
        for (j = 1; j < numberBall; j ++)
        [self placeGrayBallAtX: _margin + i * space
                          andY: 70 * j
                       withTag: i + 100];
        
        
        
     }
  
    
 }


-(void) checkSizeOfApp {
    CGSize size = self.view.bounds.size;
    NSLog(@"width = %3.0f, height = %3.0f", size.width, size.height);
}
@end
