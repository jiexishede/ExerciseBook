//
//  RWViewController.m
//  RWReactivePlayground
//
//  Created by Colin Eberhardt on 18/12/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "RWViewController.h"
#import "RWDummySignInService.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

@property (strong, nonatomic) RWDummySignInService *signInService;

@end

@implementation RWViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  

  
  self.signInService = [RWDummySignInService new];

//  
  // initially hide the failure message
  self.signInFailureText.hidden = YES;
    
    RACSignal *validPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(id value) {
        return @([self isValidPassword:value]);
    }];
    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(id value) {
        return @([self isValidUsername:value]);
    }];
    
    RAC(self.usernameTextField, backgroundColor) = [validUsernameSignal map:^id(id value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    RAC(self.passwordTextField, backgroundColor) = [validPasswordSignal map:^id(id value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    RAC(self.signInButton, enabled) = [RACSignal combineLatest:@[validUsernameSignal, validPasswordSignal] reduce:^id(NSNumber *validPassword,NSNumber *validUsername){
        return @([validUsername boolValue] && [validUsername boolValue]);
    }];
    
    [[[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] doNext:^(id x) {
        self.signInButton.enabled = NO;
        self.signInFailureText.hidden = YES;
    }] flattenMap:^RACStream *(id value) {
        return [self signInSignal];
    }] subscribeNext:^(id x) {
        self.signInButton.enabled = YES;
        BOOL success = [x boolValue];
        self.signInFailureText.hidden = success;
        if (success) {
            [self  performSegueWithIdentifier:@"signInSuccess" sender:self];
        }
    }];
    
    
}

- (BOOL)isValidUsername:(NSString *)username {
  return username.length > 3;
}



- (BOOL)isValidPassword:(NSString *)password {
  return password.length > 3;
}

- (RACSignal *)signInSignal{
   return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.signInService signInWithUsername:self.usernameTextField.text
    password:self.passwordTextField.text complete:^(BOOL success) {
        [subscriber sendNext:@(success)];
        [subscriber sendCompleted];
    }];
        return nil;}];
    
}

- (IBAction)signInButtonTouched:(id)sender {
//  // disable all UI controls
//  self.signInButton.enabled = NO;
//  self.signInFailureText.hidden = YES;
//  
//  // sign in
//  [self.signInService signInWithUsername:self.usernameTextField.text
//                            password:self.passwordTextField.text
//                            complete:^(BOOL success) {
//                              self.signInButton.enabled = YES;
//                              self.signInFailureText.hidden = success;
//                              if (success) {
//                                [self performSegueWithIdentifier:@"signInSuccess" sender:self];
//                              }
//                            }];
}


@end
