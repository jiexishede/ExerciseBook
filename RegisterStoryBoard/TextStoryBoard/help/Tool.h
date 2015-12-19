//
//  Tool.h
//  yyzhaofang
//
//  Created by kevingao on 13-11-4.
//  Copyright (c) 2013年 kevingao. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "config.h"          //常用宏

//#import "FMDatabase.h"
//#import "FMDatabaseQueue.h"
#import "MBProgressHUD.h"
//#import "ASIHTTPRequest.h"
//#import "SDImageCache.h"

//#import "UserModel.h"       //用户model
//#import "CityModel.h"       //城市model
//#import "ProvinceModel.h"   //省份model
//#import "ZoneModel.h"       //区域model

//APP下载地址
#define APP_DownloadURL @"http://itunes.apple.com/app/id%@?mt=8"

//用于检测版本更新 920853711
#define APPSTORE_ID @"920853711"

//友盟社会化KEY
//友盟  533cd23356240b00ca0204a7
#define UMengKey @"507fcab25270157b37000010"
//新浪key
#define SinaKey @"1436156421"
//QQ空间
#define QQKey @"101054151"
//微信Key
#define WeiXinKey @"wx939fefb1b986fc6e"

//UDID_KEY
#define UDID_KEY @"UIDI"

//ShareSDK key
#define ShareSDK_Key @"21d71b2be184"

//账户信息保存对应key
#define ACCOUNT_INFO @"AccountInfo"
#define PHONE_Number @"phoneNumber"
#define PASSWORD_Number @"passWord"

//本地城市数据库路径
#define CITYDB_Path [[NSBundle mainBundle] pathForResource:@"ChinaAreasDB" ofType:@"db"]
//城市表名
#define CityTable @"tb_city"
//省份表名
#define ProvinceTable @"tb_province"
//地区表名
#define ZoneTable @"tb_zone"

//上传图片名称
#define IMAGE_NAME @"Default.jpg"

//判断第一次启动
#define FirstLaunch @"firstLaunch"

//用户名
#define UserName @"username"
//密码
#define PassWord @"password"
//自动登录
#define AutoLogin @"AutoLogin"

//检查版本更新
@protocol Tool_CheckVersionDelegate <NSObject>

- (void)Tool_CheckVersionDelegate_Start;           //开始

- (void)Tool_CheckVersionDelegate_HaveNewVersion;  //有新版本

- (void)Tool_CheckVersionDelegate_HaveNoVersion;   //没有新版本

- (void)Tool_CheckVersionDelegate_NetWorkFaild;    //网络错误

@end

@interface Tool : NSObject

//检测版本代理对象
@property(assign,nonatomic)id<Tool_CheckVersionDelegate> CheckDelegate;

//获取单例对象
+(Tool *)shareToolObj;

//--------------------基本方法-----------------

//保存账号信息
- (void)saveAccount:(NSDictionary*)dict;

//获取账户对象
//- (UserModel*)getUserModel;

//获得字典
- (NSDictionary*)getUserNSDictionary;

//去除账户信息
- (void)removeUserDictionary;

//--------------------基本方法列表---------------------

//开始检查当前版本是否有更新
- (void)startCheckVersion;

//APP生成唯一识别码
- (void)createUDID;

//设置记住密码状态
- (void)setPassWordRemberStatus:(BOOL)status;

//返回记住密码状态
- (BOOL)getPassWordRemberStatus;

//设置自动登录状态
- (void)setAutoLoginStatus:(BOOL)status;

//返回自动登录状态
- (BOOL)getAutoLoginStatus;

//保存sessionToken
- (void)saveSessionToken:(NSString*)sessionToken;

//判断手机号码是否合法
- (BOOL)CheckPhoneNumInput:(NSString *)phoneNumber;

//判断是否为整形
- (BOOL)isPureInt:(NSString*)string;

//将纯色转换为UIImage，可以给UIButton使用
- (UIImage *)createImageWithColor:(UIColor *)color;

//创建json字符串
- (NSString*)writeJson:(id)dict;

//解析json字符串ß
- (id)parserJson:(NSData*)data;

//判断是否是iPhone
- (bool)checkDeviceIsIphone;

//邮箱
- (BOOL)validateEmail:(NSString*)email;

//调用系统打电话的功能
- (void)callPhone:(NSString*)phoneNumber;

//调用系统发短信的功能
- (void)sendMessage:(NSString*)phoneNumber;

//获取当前日期
- (NSString*)GetCurrentDate;

//比较字符串中是否含有子字符串
- (BOOL)CheckStrTo:(NSString*)str1 With:(NSString*)str2;


//颜色码转换 16进位到UICOLOR
- (UIColor *) colorWithHexString: (NSString *)color;

//清除图片缓存
- (void)clearImageCache;

//提示一个hud
- (void)giveHud:(NSString*)message;

//URL中文转码
- (NSString*)encodeUrl:(NSString*)urlStr;

//切割图片
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

//存储头像图片
- (void)saveImage:(UIImage*)tempImage;

//获得头像路径
- (NSString*)getPersonIconPath;

//去往appStore
- (void)goToAppStore;

//根据当前是否是横竖屏来获取当前视图大小
- (CGRect)getClientRect:(BOOL)isHorz;

//设置Bar样式
- (void)setNavigationStyle:(UINavigationBar*)bar;

//获得当前的方向
- (BOOL)isCurrentHorz;

//时间戳转换为时间字符串
- (NSString*)TimespToString:(NSString*)Timesp;

//带秒钟
- (NSString*)TimespToStringWithSecond:(NSString *)Timesp;

//判断是否是中文
- (BOOL)checkChinese:(NSString*)str;

//比较选择时间，是否比今天的时间大
- (BOOL)compareDateisBigThenNow:(NSString *)choiceStr;

//过滤html标签
-(NSString *)filterHTML:(NSString *)html;

//---------------------------------------------------------//

//判断是否登录
- (BOOL)isLogin;

//查询省份
- (NSString*)selectProvince:(NSString*)Id;

//查询城市
- (NSString*)selectCity:(NSString*)Id;

//查询地区
- (NSString*)selectZone:(NSString*)Id;

//查询区域数组
- (NSMutableArray*)selectZoneWithCityId:(NSString*)CityId;

//查询所有的城市
- (NSMutableArray*)selectAllCity;

//查询所有省份
- (NSMutableArray*)selectAllProvince;

//根据省份ID来查询城市
- (NSMutableArray*)selectCityInProvince:(NSString*)ProvinceId;

//获得本地上传的图片路径
- (NSString*)GetUploadImagePath;

//图片存入本地
- (void)SaveImageInTheDefaultPath:(UIImage*)image;

//选择图片方向
- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

//-----------------场馆模块方法-------------------------//

//存储城市数据
//- (void)saveVenuesCity:(CityModel*)tempModel;

//获得城市数据
//- (CityModel*)getCityModel;

//------------------辅助方法---------------------------//

//输入年 月 日-----来计算获取日期
- (NSString *)getWeek:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

//获得当前年份
- (NSInteger)getCurrentYear;

//获得运动的名称
- (NSString*)getSportName:(NSString*)sport_type;

//计算天数差
- (NSString*)compareCurrentTime:(NSString*)compareDate;

@end
