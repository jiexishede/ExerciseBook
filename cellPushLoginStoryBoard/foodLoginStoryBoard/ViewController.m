//
//  ViewController.m
//  foodLoginStoryBoard
//
//  Created by 戒惜舍得 on 12/29/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "ViewController.h"
#import "LoginTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClick:(id)sender {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LoginStoryboard" bundle:[NSBundle mainBundle]];
    LoginTableViewController *loginTableViewController = [storyboard instantiateInitialViewController];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginTableViewController];
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
    
}

@end
