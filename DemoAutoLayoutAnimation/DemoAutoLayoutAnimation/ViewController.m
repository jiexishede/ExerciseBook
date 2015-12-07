//
//  ViewController.m
//  DemoAutoLayoutAnimation
//
//  Created by 戒惜舍得 on 12/7/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "ViewController.h"

#import "HomePageAnimationUntil.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *readBeforeLogin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineViewWidthConstraint;

@end

static CGFloat const kLineWith = 345.0;

@implementation ViewController

#pragma mark Controller Life

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.layer.masksToBounds = YES;
    _lineViewWidthConstraint.constant = 0;
    _topTitleLabel.transform = CGAffineTransformMakeTranslation(0, -200);
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [HomePageAnimationUntil animateWithAnimateView:_topTitleLabel onTheMap:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.000 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HomePageAnimationUntil animateWithConstraints:_lineViewWidthConstraint constant:kLineWith onTheMap:self.view];
    });
    [HomePageAnimationUntil viewMaskAnimation:_readBeforeLogin withBeginTime:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
