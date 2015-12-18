//
//  RegisterInputModel.h
//  chinago
//
//  Created by kevingao on 14-5-6.
//  Copyright (c) 2014年 kevingao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterInputModel : NSObject


@property(strong,nonatomic)NSString* phoneNum;
@property(strong,nonatomic)NSString* email;
@property(strong,nonatomic)NSString* password;
@property(strong,nonatomic)NSString* name;
@property(strong,nonatomic)NSString* gender;
@property(strong,nonatomic)NSString* birthday;
@property(strong,nonatomic)NSString* city_id;
@property(strong,nonatomic)NSString* current_status;

@property(strong,nonatomic)NSString* headPortrait;
@property(strong,nonatomic)NSString* location;

@end
