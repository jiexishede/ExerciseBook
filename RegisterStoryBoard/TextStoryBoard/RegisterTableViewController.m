//
//  RegisterTableViewController.m
//  TextStoryBoard
//
//  Created by 戒惜舍得 on 12/15/15.
//  Copyright © 2015 戒惜舍得. All rights reserved.
//

#import "RegisterTableViewController.h"

#import <AFNetworking/AFHTTPSessionManager.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
//#import "RequestData.h"
//#import "Tool.h"
#import "MBProgressHUD.h"
#import "RegisterInputModel.h"

@interface RegisterTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextStepButton;
@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeButton;
@property (nonatomic, strong) RegisterInputModel *inputModel;
@property (nonatomic, assign) int i;
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation RegisterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   RACSignal *validPhoneNumberSignal = [self.phoneTextField.rac_textSignal map:^id(id value) {
       return @([self isValidPhoneNumber:value]);
   }];
    RACSignal *validVerificationCodeSignal = [self.verificationCodeTextField.rac_textSignal map:^id(id value) {
        return @([self isValidVerificationCode:value]);
    }];
    
    RAC(self.phoneTextField, backgroundColor) = [validPhoneNumberSignal map:^id(id value) {
        return [value boolValue] ? [UIColor greenColor] : [UIColor yellowColor];
    }];
    
    RAC(self.verificationCodeTextField, backgroundColor) = [validVerificationCodeSignal map:^id(id value) {
        return [value boolValue] ? [UIColor greenColor] : [UIColor yellowColor];
    }];
    
    RAC(self.nextStepButton, enabled) = [RACSignal combineLatest:@[validVerificationCodeSignal, validPhoneNumberSignal] reduce:^id(NSNumber *validPhoneNumberSignal, NSNumber *validVerificationCodeSignal){
        return @( [validPhoneNumberSignal boolValue] && [validVerificationCodeSignal boolValue]);
    }];
    RAC(self.nextStepButton, hidden) = [RACSignal combineLatest:@[validVerificationCodeSignal, validPhoneNumberSignal] reduce:^id(NSNumber *validPhoneNumberSignal, NSNumber *validVerificationCodeSignal){
        return @( ![validPhoneNumberSignal boolValue] || ![validVerificationCodeSignal boolValue]);
    }];
//  ///TODO:   正则表达式验证手机号..
//    if (![[Tool shareToolObj] CheckPhoneNumInput:_inputModel.phoneNum]) {
//        [[Tool shareToolObj] giveHud:@"请填写正确手机号"];
//        return;
//    }
// 
//    ///TODO: 验证时间 倒计时
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(function:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

////请求手机验证码
//-(void)requestCode{
//    
//    //"phoneNumber":"电话号"
//    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.removeFromSuperViewOnHide = YES;
////    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
////                          _inputModel.phoneNum,@"phoneNumber",
////                          nil];
//    NSDictionary *dict = @{_inputModel.phoneNum:@"phoneNumber"};
//    //-------------------------------------------
//    RequestData* request = [[RequestData alloc] init];
//    [request requestgetCode_SERVICE:dict];
//    [request setCallBackBlock_RequestDataCallBackBlock:^(NSDictionary* responseInfo){
//        [hud hide:YES];
//        NSLog(@"res = %@",responseInfo);
//        if (responseInfo) {
//            NSString * msg = [NSString stringWithFormat:@"%@",[responseInfo objectForKey:@"desc"]];
//            [[Tool shareToolObj] giveHud:msg];
//            
//        }else{
//            //网络错误
//            [[Tool shareToolObj] giveHud:@"网络错误"];
//        }
//    }];
//    
//    
//    
//    /*
//     http://ip:port/chinago/service
//     
//     {
//     "funcId":"CG010010",
//     "telePhone":"13911017712",
//     "code":"111111"
//     }
//     
//     telePhone:手机号
//     code：短信验证码
//     
//     
//     ------
//     
//      NSDictionary *dict = @{_inputModel.phoneNum:@"phoneNumber"};
//     */
//    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    NSDictionary *dictionary = @{_inputModel.phoneNum : @"phoneNumber"};
//                                 
//    //建立请求
////    NSURL *url = [NSURL URLWithString:CHINAGO_GETCODE_URL_SERVICE];
//    
////    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//
//    [manager POST:CHINAGO_GETCODE_URL_SERVICE parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        
//    } progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"---验证码成功--%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"----验证码失败--%@", error);
//
//    }];
//    
//    
//}

//
////   倒计时
//-(void)function:(id)sender{
//    self.i--;
//    [self.getVerificationCodeButton setTitle:[NSString stringWithFormat:@"重新发送(%d)",self.i] forState:UIControlStateNormal];
//    if (self.i == 0) {
//        [self.timer invalidate];
//        self.timer = nil;
//        self.getVerificationCodeButton.enabled = YES;
//        [self.getVerificationCodeButton setBackgroundImage:[UIImage imageNamed:@"sendTel@2x.png"] forState:UIControlStateNormal];
//        [self.getVerificationCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
//        [self.getVerificationCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        self.i = 60;
//        
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



#pragma mark - TouchEvent
- (IBAction)correctCode:(id)sender {
    
    
}

- (IBAction)nextStep:(id)sender {
    
    
}


#pragma mark - Private Methods

- (BOOL)isValidPhoneNumber:(NSString *)phoneNumber{
    return phoneNumber.length == 11;
}

- (BOOL)isValidVerificationCode:(NSString *)VerificationCode{
    return VerificationCode.length == 6;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
