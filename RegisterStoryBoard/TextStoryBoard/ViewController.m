//
//  ViewController.m

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
