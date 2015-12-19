//
//  RequestData.m
//  xinPan_jjr
//
//  Created by kevingao on 13-12-16.
//  Copyright (c) 2013年 kevingao. All rights reserved.
//

#import "RequestData.h"

#import "Tool.h"        //辅助类
#import "config.h"      //API头文件

#import "ASIFormDataRequest.h"
#import "SBJsonParser.h"
#import "JSONKit.h"

#import "HttpManager.h"     //负责图片上传

@implementation RequestData

//初始化方法
- (id)init
{
	self = [super init];
	if (self)
	{
        //初始化一些东西
	}
	return self;
}

//发送请求
//SERVICE
- (void)requestAction_SERVICE:(NSDictionary*)dict{

    //写成json字符串
    NSString* json = [[Tool shareToolObj] writeJson:dict];
    
    //建立请求
    NSURL *url = [NSURL URLWithString:CHINAGO_SERVER_URL_SERVICE];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request setRequestMethod:@"POST"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    
    //异步加载
    [request startAsynchronous];
    
    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(responseInfo);
        }
    }];
    //失败回调
    [request setFailedBlock:^(){
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(nil);
        }
        
    }];

}


//发送请求 请求手机号验证吗
//SERVICE
- (void)requestgetCode_SERVICE:(NSDictionary*)dict{
    
    //写成json字符串
    NSString* json = [[Tool shareToolObj] writeJson:dict];
    
    //建立请求
    NSURL *url = [NSURL URLWithString:CHINAGO_GETCODE_URL_SERVICE];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request setRequestMethod:@"POST"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    
    //异步加载
    [request startAsynchronous];
    
    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(responseInfo);
        }
    }];
    //失败回调
    [request setFailedBlock:^(){
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(nil);
        }
        
    }];
    
}


//INTERFACE
- (void)requestAction_INTERFACE:(NSDictionary*)dict{

    //写成json字符串
    NSString* json = [[Tool shareToolObj] writeJson:dict];
    
    //建立请求
    NSURL *url = [NSURL URLWithString:CHINAGO_SERVER_URL_INTERFACE];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request setRequestMethod:@"POST"];
  //  request.timeOutSeconds = 20;
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    
    //异步加载
    [request startAsynchronous];
    
    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(responseInfo);
        }
        
    }];
    
    //失败回调
    [request setFailedBlock:^(){
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(nil);
        }
    }];
}

//CHESHI
- (void)requestAction_CESHI:(NSDictionary*)dict{
    
    //写成json字符串
    NSString* json = [[Tool shareToolObj] writeJson:dict];
    
    //建立请求
    NSURL *url = [NSURL URLWithString:CHINAGO_SERVER_URL_CESHI];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request setRequestMethod:@"POST"];
    [request appendPostData:[json dataUsingEncoding:NSUTF8StringEncoding]];
    
    //异步加载
    [request startAsynchronous];
    
    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(responseInfo);
        }
        
    }];
    
    //失败回调
    [request setFailedBlock:^(){
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(nil);
        }
    }];
}

//NEWINTERFACE
- (void)requestAction_NEWINTERFACE:(NSString*)dict andrequestFlag:(NSString *)requestFlag{
    
    //建立请求
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Servlet_IntegralManage",CHINAGO_SERVER_URL_JF]];
    //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.108:8080/chinago/servlet/Servlet_IntegralManage",nil]];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    
    [request setPostValue:requestFlag forKey:@"requestFlag"];
    [request setPostValue:dict forKey:@"requestparam"];
    
    [request startAsynchronous];
    
    
    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(responseInfo);
        }
        
    }];
    
    //失败回调
    [request setFailedBlock:^(){
        
        if (RequestDataCallBackBlock) {
            RequestDataCallBackBlock(nil);
        }
    }];
    
}


//留言板
-(NSArray *)pid:(NSString *)pid
{
    //获取约战留言板信息，需用户gym_id参数
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Servlet_GauntletManage",CHINAGO_SERVER_URL_JF]];
    ASIFormDataRequest *requestform = [[ASIFormDataRequest alloc] initWithURL:url];
    NSDictionary *cgdic = [NSDictionary dictionaryWithObjectsAndKeys:pid,@"pid",@"0",@"pageStart",@"50",@"pageSize", nil];
    NSString *cgstring = [cgdic JSONString];
    NSString *cgsttr = @"messageQuery";
    [requestform setPostValue:cgsttr forKey:@"requestFlag"];
    [requestform setPostValue:cgstring forKey:@"requestparam"];
    [requestform startSynchronous];
    //使用SBjosn将获取到的信息存入字典
    SBJsonParser * parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *dicMessageInfo = [parser objectWithString:[requestform responseString]];
    NSArray *dicarray =[dicMessageInfo objectForKey:@"result"];
    
//    NSLog(@"请求地址：%@",url);
//    NSLog(@"上传打包参数:%@",cgstring);
//    NSLog(@"约战留言板信息：%@",[requestform responseString]);
    
    return dicarray;
}

//回复留言
-(NSDictionary *)mid:(NSString *)mid user_id:(NSString *)user_id content:(NSString *)content
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Servlet_GauntletManage",CHINAGO_SERVER_URL_JF]];
    
    ASIFormDataRequest *requestform = [[ASIFormDataRequest alloc] initWithURL:url];
    NSDictionary *cgdic = [NSDictionary dictionaryWithObjectsAndKeys:mid,@"mid",user_id,@"user_id",content,@"content", nil];
    NSString *cgstring = [cgdic JSONString];
    NSString *cgsttr = @"re_messageInsert";
    [requestform setPostValue:cgsttr forKey:@"requestFlag"];
    [requestform setPostValue:cgstring forKey:@"requestparam"];
    [requestform startSynchronous];
    //使用SBjosn将获取到的信息存入字典
    SBJsonParser * parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *dicMessageInfo = [parser objectWithString:[requestform responseString]];
    
    NSLog(@"请求地址：%@",url);
    NSLog(@"上传打包参数:%@",cgstring);
    NSLog(@"回复留言反馈信息：%@",[requestform responseString]);
    
    return dicMessageInfo;
    
}

//发表留言
-(NSDictionary *)pid:(NSString *)pid user_id:(NSString *)user_id ms_user_id:(NSString *)ms_user_id content:(NSString *)content
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/Servlet_GauntletManage",CHINAGO_SERVER_URL_JF]];
    ASIFormDataRequest *requestform = [[ASIFormDataRequest alloc] initWithURL:url];
    NSDictionary *cgdic = [NSDictionary dictionaryWithObjectsAndKeys:pid,@"pid",user_id,@"user_id",ms_user_id,@"ms_user_id",content,@"content", nil];
    NSString *cgstring = [cgdic JSONString];
    NSString *cgsttr = @"messageInsert";
    [requestform setPostValue:cgsttr forKey:@"requestFlag"];
    [requestform setPostValue:cgstring forKey:@"requestparam"];
    [requestform startSynchronous];
    //使用SBjosn将获取到的信息存入字典
    SBJsonParser * parser = [[SBJsonParser alloc]init];
    NSMutableDictionary *dicMessageInfo = [parser objectWithString:[requestform responseString]];
    
    NSLog(@"请求地址：%@",url);
    NSLog(@"上传打包参数:%@",cgstring);
    NSLog(@"留言反馈信息：%@",[requestform responseString]);
    
    return dicMessageInfo;
    
}

//上传图片
- (void)requestAction_UpLoadImage:(NSDictionary*)dict{
    
    NSString* obj = [dict objectForKey:@"obj"];
    NSString* objFielName = [dict objectForKey:@"objFielName"];
    NSString* uid = [dict objectForKey:@"uid"];
    NSString* appType = [dict objectForKey:@"appType"];
        
    //-------创建请求---------------------------------------------
    
    NSURL* url = [NSURL URLWithString:CHINAGO_SERVER_URL_UPFILE];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setRequestMethod:@"POST"];
    
    //图片路径
    [request setFile:obj forKey:@"obj"];
    //文件名
    [request setPostValue:objFielName forKey:@"objFielName"];
    //uid
    [request setPostValue:uid forKey:@"uid"];
    //功能模块
    [request setPostValue:appType forKey:@"appType"];
    
    request.timeOutSeconds = 50;
    
    [request startAsynchronous];

    //完成回调
    [request setCompletionBlock:^(){
        
        //NSLog(@"%@",[[[NSString alloc] initWithData:request.responseData encoding:NSUTF8StringEncoding] autorelease]);
        
        NSDictionary* responseInfo = [[Tool shareToolObj] parserJson:request.responseData];
        
        if (UpLoadImageCallBackBlock) {
            UpLoadImageCallBackBlock(responseInfo);
        }
        
    }];
    
    //失败回调
    [request setFailedBlock:^(){
        
        if (UpLoadImageCallBackBlock) {
            UpLoadImageCallBackBlock(nil);
        }
    }];
}

//设置回调block
- (void)setCallBackBlock_UpLoadImageCallBackBlock:(void(^)(NSDictionary* requestDict))eachBark{

    [UpLoadImageCallBackBlock release];
    UpLoadImageCallBackBlock = [eachBark copy];
}

- (void)setCallBackBlock_RequestDataCallBackBlock:(void(^)(NSDictionary* requestDict))eachBark{
    [RequestDataCallBackBlock release];
    RequestDataCallBackBlock = [eachBark copy];
}

@end
