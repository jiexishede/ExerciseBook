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
  
//  [self updateUIState];
    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(id value) {
        return @([self isValidUsername:value]);
    }];
    RACSignal *validPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(id value) {
        return @([self isValidPassword:value]);
    }];
    
    RAC(self.usernameTextField, backgroundColor) = validUsernameSignal map:^id(id value) {
        return 
    }
    
  
  self.signInService = [RWDummySignInService new];

  // initially hide the failure message
  self.signInFailureText.hidden = YES;
}


- (RACSignal *)signInSignal{
    
    
}

- (BOOL)isValidUsername:(NSString *)username {
  return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
  return password.length > 3;
}

- (IBAction)signInButtonTouched:(id)sender {
  // disable all UI controls
  self.signInButton.enabled = NO;
  self.signInFailureText.hidden = YES;
  
  // sign in
  [self.signInService signInWithUsername:self.usernameTextField.text
                            password:self.passwordTextField.text
                            complete:^(BOOL success) {
                              self.signInButton.enabled = YES;
                              self.signInFailureText.hidden = success;
                              if (success) {
                                [self performSegueWithIdentifier:@"signInSuccess" sender:self];
                              }
                            }];
}


// updates the enabled state and style of the text fields based on whether the current username
// and password combo is valid
//- (void)updateUIState {
//  self.usernameTextField.backgroundColor = self.usernameIsValid ? [UIColor clearColor] : [UIColor yellowColor];
//  self.passwordTextField.backgroundColor = self.passwordIsValid ? [UIColor clearColor] : [UIColor yellowColor];
//  self.signInButton.enabled = self.usernameIsValid && self.passwordIsValid;
//}
//
//- (void)usernameTextFieldChanged {
//  self.usernameIsValid = [self isValidUsername:self.usernameTextField.text];
//  [self updateUIState];
//}
//
//- (void)passwordTextFieldChanged {
//  self.passwordIsValid = [self isValidPassword:self.passwordTextField.text];
//  [self updateUIState];
//}

@end