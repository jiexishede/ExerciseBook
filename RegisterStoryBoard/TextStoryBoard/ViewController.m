//
//  ViewController.m
//  TextStoryBoard
//
//  Created by 戒惜舍得 on 12/15/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "ViewController.h"
#import "RegisterTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)login:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"RegisterTableViewContrller" bundle:[NSBundle mainBundle] ];
    UINavigationController *navC  = storyboard.instantiateInitialViewController;
    
    [self  presentViewController:navC animated:NO completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
