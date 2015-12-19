//
//  RequestData.h
//  xinPan_jjr
//
//  Created by kevingao on 13-12-16.
//  Copyright (c) 2013年 kevingao. All rights reserved.
//

#import <Foundation/Foundation.h>

//网络请求对象

//------------图片上传观察者名称---------------//
//成功观察者
#define Success_Observer @"SuccessObserver"
//失败观察者
#define Failed_Observer @"FailedObserver"

@interface RequestData : NSObject
{
    //请求回调block
    void (^RequestDataCallBackBlock)(NSDictionary* requestDict);
    
    //上传图片回调block
    void (^UpLoadImageCallBackBlock)(NSDictionary* requestDict);
}

//初始化方法
- (id)init;

//发送请求
//SERVICE
- (void)requestAction_SERVICE:(NSDictionary*)dict;

- (void)requestgetCode_SERVICE:(NSDictionary*)dict;
//INTERFACE
- (void)requestAction_INTERFACE:(NSDictionary*)dict;

//CESHI
- (void)requestAction_CESHI:(NSDictionary*)dict;

//NEWINTERFACE
- (void)requestAction_NEWINTERFACE:(NSString*)dict andrequestFlag:(NSString *)requestFlag;

//设置回调block
- (void)setCallBackBlock_RequestDataCallBackBlock:(void(^)(NSDictionary* requestDict))eachBark;

//留言板
-(NSArray *)pid:(NSString *)pid;
//发表留言
-(NSDictionary *)pid:(NSString *)pid user_id:(NSString *)user_id ms_user_id:(NSString *)ms_user_id content:(NSString *)content;
//回复留言
-(NSDictionary *)mid:(NSString *)mid user_id:(NSString *)user_id content:(NSString *)content;
//--------------------------------------------------------//

//上传图片
- (void)requestAction_UpLoadImage:(NSDictionary*)dict;

//设置回调block
- (void)setCallBackBlock_UpLoadImageCallBackBlock:(void(^)(NSDictionary* requestDict))eachBark;

@end
