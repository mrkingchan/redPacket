//
//  ViewController.m
//  redPacket
//
//  Created by Chan on 2017/12/26.
//  Copyright © 2017年 Chan. All rights reserved.
//

#import "ViewController.h"
#import "XTLoveHeartView.h"
#import "redPacket-Swift.h"

@interface ViewController () {
    UIButton *_button;
    NSInteger _count;
    NSTimer *_timer;
}

@end

@implementation ViewController

#pragma mark --LifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    _count = 0;
    self.navigationItem.title = NSStringFromClass([self class]);
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 15, [UIScreen mainScreen].bounds.size.height / 2- 15, 50, 50);
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:@"点赞" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _button.clipsToBounds = YES;
    _button.layer.cornerRadius = _button.frame.size.height / 2;
    _button.titleLabel.font = [UIFont systemFontOfSize:13];
    [_button addTarget:self action:@selector(showLoveHeartView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    _timer = [NSTimer timerWithTimeInterval:0.25
                                     target:self
                                   selector:@selector(showLoveHeartView)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    [_timer fire];
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem {
    if ([tabBarItem isKindOfClass:[UITabBarItem class]]) {
        
    }
}
#pragma mark --privateMethod
- (void)showLoveHeartView {
    _count ++;
    [_button setTitle:[NSString stringWithFormat:@"%zd",_count] forState:UIControlStateNormal];
    XTLoveHeartView *heart = [[XTLoveHeartView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(self.view.frame.size.width - 80, self.view.bounds.size.height - 30 / 2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CollectionVC *VC = [CollectionVC new];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
