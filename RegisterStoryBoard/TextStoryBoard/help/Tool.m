//
//  Tool.m
//  yyzhaofang
//
//  Created by kevingao on 13-11-4.
//  Copyright (c) 2013年 kevingao. All rights reserved.
//

#import "Tool.h"

#import "sys/utsname.h"

#import "OpenUDID.h"                    //生成唯一识别码
#import "NSString+MD5Addition.h"        //MD5加密

#import "UINavigationBar+FlatUI.h"

static Tool *singShareTool = nil;

@implementation Tool

@synthesize CheckDelegate;

+ (Tool *)shareToolObj{

    @synchronized(singShareTool)
	{
		if (!singShareTool)
		{
			singShareTool = [[Tool alloc] init];
		}
	}
	return singShareTool;
}

- (id)init
{
	self = [super init];
	if (self)
	{
        //初始化一些东西
        
	}
	return self;
}

//保存账号信息
- (void)saveAccount:(NSDictionary*)dict{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   
                   ^{
                       // do something in background
                       
                       NSString* address =  [NSString stringWithFormat:@"%@",[dict objectForKey:@"address"]];
                       NSString* birthcity_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthcity_id"]];
                       NSString* birthday = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday"]];
                       NSString* birthday_lunar = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday_lunar"]];
                       NSString* birthday_md = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday_md"]];
                       NSString* blood_type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"blood_type"]];
                       NSString* body_form = [NSString stringWithFormat:@"%@",[dict objectForKey:@"body_form"]];
                       NSString* cdate = [NSString stringWithFormat:@"%@",[dict objectForKey:@"cdate"]];
                       NSString* city_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"city_id"]];
                       NSString* current_status = [NSString stringWithFormat:@"%@",[dict objectForKey:@"current_status"]];
                       NSString* deleted = [NSString stringWithFormat:@"%@",[dict objectForKey:@"deleted"]];
                       NSString* email = [NSString stringWithFormat:@"%@",[dict objectForKey:@"email"]];
                       NSString* face_folder = [NSString stringWithFormat:@"%@",[dict objectForKey:@"face_folder"]];
                       NSString* face_name = [NSString stringWithFormat:@"%@",[dict objectForKey:@"face_name"]];
                       NSString* gender = [NSString stringWithFormat:@"%@",[dict objectForKey:@"gender"]];
                       NSString* intro = [NSString stringWithFormat:@"%@",[dict objectForKey:@"intro"]];
                       NSString* invite_code = [NSString stringWithFormat:@"%@",[dict objectForKey:@"invite_code"]];
                       NSString* lastlogin = [NSString stringWithFormat:@"%@",[dict objectForKey:@"lastlogin"]];
                       NSString* login_days = [NSString stringWithFormat:@"%@",[dict objectForKey:@"login_days"]];
                       NSString* married = [NSString stringWithFormat:@"%@",[dict objectForKey:@"married"]];
                       NSString* mdate = [NSString stringWithFormat:@"%@",[dict objectForKey:@"mdate"]];
                       NSString* mobile = [NSString stringWithFormat:@"%@",[dict objectForKey:@"mobile"]];
                       NSString* msn = [NSString stringWithFormat:@"%@",[dict objectForKey:@"msn"]];
                       NSString* name = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name"]];
                       NSString* name_py = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name_py"]];
                       NSString* name_py_short = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name_py_short"]];
                       NSString* password = [NSString stringWithFormat:@"%@",[dict objectForKey:@"password"]];
                       NSString* qq = [NSString stringWithFormat:@"%@",[dict objectForKey:@"qq"]];
                       NSString* status = [NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]];
                       NSString* uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
                       NSString* user_title = [NSString stringWithFormat:@"%@",[dict objectForKey:@"user_title"]];
                       NSString* zip = [NSString stringWithFormat:@"%@",[dict objectForKey:@"zip"]];
                       
                       NSDictionary* tempDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                                 address,@"address",
                                                 birthcity_id,@"birthcity_id",
                                                 birthday,@"birthday",
                                                 birthday_lunar,@"birthday_lunar",
                                                 birthday_md,@"birthday_md",
                                                 
                                                 blood_type,@"blood_type",
                                                 body_form,@"body_form",
                                                 cdate,@"cdate",
                                                 city_id,@"city_id",
                                                 current_status,@"current_status",

                                                 deleted,@"deleted",
                                                 email,@"email",
                                                 face_folder,@"face_folder",
                                                 face_name,@"face_name",
                                                 gender,@"gender",

                                                 intro,@"intro",
                                                 invite_code,@"invite_code",
                                                 lastlogin,@"lastlogin",
                                                 login_days,@"login_days",
                                                 married,@"married",
                                                 
                                                 mdate,@"mdate",
                                                 mobile,@"mobile",
                                                 msn,@"msn",
                                                 name,@"name",
                                                 name_py,@"name_py",
                                                 
                                                 name_py_short,@"name_py_short",
                                                 password,@"password",
                                                 qq,@"qq",
                                                 status,@"status",
                                                 uid,@"uid",
                                                 
                                                 user_title,@"user_title",
                                                 zip,@"zip",
                                                 
                                                 nil];
                       
                       [[NSUserDefaults standardUserDefaults] removeObjectForKey:ACCOUNT_INFO];
                       [[NSUserDefaults standardUserDefaults] setObject:tempDict forKey:ACCOUNT_INFO];
                       [[NSUserDefaults standardUserDefaults] synchronize];
                       
                       dispatch_async(dispatch_get_main_queue(), ^{
                           
                           // do something on main thread
                           
                       });
                       
                   });
}

//获得字典
- (NSDictionary*)getUserNSDictionary{

    NSDictionary* dict = [[NSUserDefaults standardUserDefaults] objectForKey:ACCOUNT_INFO];
    return dict;
}

//获取账户对象
- (UserModel*)getUserModel{

    NSDictionary* dict = [[NSUserDefaults standardUserDefaults] objectForKey:ACCOUNT_INFO];

    UserModel* model = [[UserModel alloc] init];
    model.address =  [NSString stringWithFormat:@"%@",[dict objectForKey:@"address"]];
    model.birthcity_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthcity_id"]];
    model.birthday = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday"]];
    model.birthday_lunar = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday_lunar"]];
    model.birthday_md = [NSString stringWithFormat:@"%@",[dict objectForKey:@"birthday_md"]];
    model.blood_type = [NSString stringWithFormat:@"%@",[dict objectForKey:@"blood_type"]];
    model.body_form = [NSString stringWithFormat:@"%@",[dict objectForKey:@"body_form"]];
    model.cdate = [NSString stringWithFormat:@"%@",[dict objectForKey:@"cdate"]];
    model.city_id = [NSString stringWithFormat:@"%@",[dict objectForKey:@"city_id"]];
    model.current_status = [NSString stringWithFormat:@"%@",[dict objectForKey:@"current_status"]];
    model.deleted = [NSString stringWithFormat:@"%@",[dict objectForKey:@"deleted"]];
    model.email = [NSString stringWithFormat:@"%@",[dict objectForKey:@"email"]];
    model.face_folder = [NSString stringWithFormat:@"%@",[dict objectForKey:@"face_folder"]];
    model.face_name = [NSString stringWithFormat:@"%@",[dict objectForKey:@"face_name"]];
    model.gender = [NSString stringWithFormat:@"%@",[dict objectForKey:@"gender"]];
    model.intro = [NSString stringWithFormat:@"%@",[dict objectForKey:@"intro"]];
    model.invite_code = [NSString stringWithFormat:@"%@",[dict objectForKey:@"invite_code"]];
    model.lastlogin = [NSString stringWithFormat:@"%@",[dict objectForKey:@"lastlogin"]];
    model.login_days = [NSString stringWithFormat:@"%@",[dict objectForKey:@"login_days"]];
    model.married = [NSString stringWithFormat:@"%@",[dict objectForKey:@"married"]];
    model.mdate = [NSString stringWithFormat:@"%@",[dict objectForKey:@"mdate"]];
    model.mobile = [NSString stringWithFormat:@"%@",[dict objectForKey:@"mobile"]];
    model.msn = [NSString stringWithFormat:@"%@",[dict objectForKey:@"msn"]];
    model.name = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name"]];
    model.name_py = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name_py"]];
    model.name_py_short = [NSString stringWithFormat:@"%@",[dict objectForKey:@"name_py_short"]];
    model.password = [NSString stringWithFormat:@"%@",[dict objectForKey:@"password"]];
    model.qq = [NSString stringWithFormat:@"%@",[dict objectForKey:@"qq"]];
    model.status = [NSString stringWithFormat:@"%@",[dict objectForKey:@"status"]];
    model.uid = [NSString stringWithFormat:@"%@",[dict objectForKey:@"uid"]];
    model.user_title = [NSString stringWithFormat:@"%@",[dict objectForKey:@"user_title"]];
    model.zip = [NSString stringWithFormat:@"%@",[dict objectForKey:@"zip"]];
    return model;
}

//去除账户信息
- (void)removeUserDictionary{

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ACCOUNT_INFO];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//--------------------------------------------------------//

//APP生成唯一识别码
- (void)createUDID{
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:UDID_KEY] length] <= 0) {
        
        //生成UDID，保存到文件系统
        NSString* UDID = [OpenUDID value];
        [[NSUserDefaults standardUserDefaults] setObject:UDID forKey:UDID_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

//生成基类请求字典
- (NSMutableDictionary*)createBaseDict{
    
    NSMutableDictionary* info = [NSMutableDictionary dictionaryWithCapacity:0];
    
    //获取系统当前的时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a= [dat timeIntervalSince1970]*1000;
    //转为字符型
    NSString* timestamp = [NSString stringWithFormat:@"%ld",(long)a];

    //默认: 1
    NSString* activeStatus = @"1";
    
    //secretKey
    NSString* secretKey = @"";
    
    //设备唯一标识码
    NSString* udid = [[NSUserDefaults standardUserDefaults] objectForKey:UDID_KEY];
    
    //默认为空字符串
    NSString* deviceCode = @"";
    
    //默认为: hzy
    NSString* clientNo = @"hzy";
    
    //会话令牌
    NSString* sessionToken = @"";
    
    //用户ID
    NSString* userId = @"";
    
    //系统信息
    NSString* systemName = [UIDevice currentDevice].systemName;
    NSString* systemVersion = [UIDevice currentDevice].systemVersion;
    //NSString* band = [UIDevice currentDevice].model;
    NSString* band = [self deviceString]; 
    NSDictionary* ua = [NSDictionary dictionaryWithObjectsAndKeys:systemName,@"systemName",systemVersion,@"systemVersion",band,@"band", nil];
    
    //app版本信息
    NSInteger versionNum = [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"] intValue];
    NSNumber* versionNumber = [NSNumber numberWithInt:versionNum];
    NSDictionary* version = [NSDictionary dictionaryWithObjectsAndKeys:versionNumber,@"appVersionCode", nil];
    
    //请求指令码
    NSString* actionCode = @"";
    
    [info setObject:timestamp forKey:@"timestamp"];
    [info setObject:activeStatus forKey:@"activeStatus"];
    [info setObject:secretKey forKey:@"secretKey"];
    [info setObject:udid forKey:@"udid"];
    [info setObject:deviceCode forKey:@"deviceCode"];
    [info setObject:clientNo forKey:@"clientNo"];
    [info setObject:sessionToken forKey:@"sessionToken"];
    [info setObject:userId forKey:@"userId"];
    [info setObject:ua forKey:@"ua"];
    [info setObject:version forKey:@"version"];
    [info setObject:actionCode forKey:@"actionCode"];
    
    return info;
}

//获取当前设备名称
- (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    NSLog(@"NOTE: Unknown device type: %@", deviceString);
    
    return deviceString;
}

//设置记住密码状态
- (void)setPassWordRemberStatus:(BOOL)status{

    [[NSUserDefaults standardUserDefaults] setBool:status forKey:@"PassWordRemberStatus"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//返回记住密码状态
- (BOOL)getPassWordRemberStatus{
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"PassWordRemberStatus"];
}

//设置自动登录状态
- (void)setAutoLoginStatus:(BOOL)status{

    [[NSUserDefaults standardUserDefaults] setBool:status forKey:@"AutoLoginStatus"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//返回自动登录状态
- (BOOL)getAutoLoginStatus{
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"AutoLoginStatus"];
}

//点击登录后，根据情况保存用户信息
- (void)saveAccountInfo:(NSDictionary*)dict{

    //保存账户信息
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:ACCOUNT_INFO];
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:ACCOUNT_INFO];

    [[NSUserDefaults standardUserDefaults] synchronize];
}

//保存sessionToken
- (void)saveSessionToken:(NSString*)sessionToken{
    
    //替换sessionToken
    NSMutableDictionary* info = [[NSUserDefaults standardUserDefaults] objectForKey:ACCOUNT_INFO];
    [info setObject:sessionToken forKey:@"sessionToken"];
    //保存账户信息
    [[NSUserDefaults standardUserDefaults] setObject:info forKey:ACCOUNT_INFO];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//获取保存的用户信息
- (NSMutableDictionary*)getAccountInfo{

    NSMutableDictionary* info = [[NSUserDefaults standardUserDefaults] objectForKey:ACCOUNT_INFO];
    
    return info;
}

//判断手机号码是否合法
- (BOOL)CheckPhoneNumInput:(NSString *)phoneNumber{
    
    NSString *Regex =@"(13[0-9]|14[57]|15[012356789]|18[02356789])\\d{8}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:phoneNumber];
}

//判断是否为整形
- (BOOL)isPureInt:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    
    int val;
    
    return[scan scanInt:&val] && [scan isAtEnd];
}


//颜色码转换 16进位到UICOLOR
- (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


//颜色转UIImage
- (UIImage *)createImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

//创建json字符串
- (NSString*)writeJson:(id)dict{
    
    NSError* error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString* jsonString =[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

//解析json
- (id)parserJson:(NSData*)data{
    
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

//判断是否是iPhone
- (bool)checkDeviceIsIphone{

    NSString *name =@"iPhone";
    
    NSString *deviceType = [UIDevice currentDevice].model;
    
    //NSLog(@"deviceType = %@", deviceType);
    
    NSRange range = [deviceType rangeOfString:name];
    
    return range.location != NSNotFound;
}

//邮箱
- (BOOL)validateEmail:(NSString*)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//调用系统打电话的功能
- (void)callPhone:(NSString*)phoneNumber{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNumber]]];
}

//调用系统发短信的功能
- (void)sendMessage:(NSString*)phoneNumber{

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",phoneNumber]]];
}

//获取当前日期
- (NSString*)GetCurrentDate{

    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateAndTime =  [dateFormatter stringFromDate:senddate];
    
    return dateAndTime;
}

//清除图片缓存
- (void)clearImageCache{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   
                   ^{
                       // do something in background
                       
                       [[SDImageCache sharedImageCache]   clearDisk];
                       [[SDImageCache sharedImageCache]   cleanDisk];
                       [[SDImageCache sharedImageCache]   clearMemory];

                       dispatch_async(dispatch_get_main_queue(), ^{
                           
                           // do something on main thread
                           
                       });
                       
            });

}

//提示一个hud
- (void)giveHud:(NSString*)message{

    //显示在window上面
    AppDelegate* appdelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    //指示器
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:appdelegate.window animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.labelFont = [UIFont systemFontOfSize:16];
    hud.margin = 25.f;
    hud.yOffset = 0.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.0];
}

//检查更新
-(void)startCheckVersion{
    /*
    //开始
    if (CheckDelegate) {
        [CheckDelegate Tool_CheckVersionDelegate_Start];
    }
    
    NSString *urlStr =[NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",APPSTORE_ID];
    
    NSString *content =[NSString stringWithFormat:@""];
    
	__block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
	[request setRequestMethod:@"POST"];
    
	[ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:NO];
    
	[request setRequestHeaders:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"application/x-www-form-urlencoded",@"Content-Type",[NSString stringWithFormat:@"%d",[content length]],@"Content-Length",nil]];
    
	if([content length]>0)
	{
		[request appendPostData:[content dataUsingEncoding:NSUTF8StringEncoding]];
	}
    
    //异步加载
    [request startAsynchronous];
    
    //成功回调
    [request setCompletionBlock:^(){
                
        NSData* jsonData = request.responseData;
        NSDictionary* jsonDict = [[Tool shareToolObj] parserJson:jsonData];//解析json
        NSArray *resultArray = [jsonDict objectForKey:@"results"];
        
        if(resultArray.count <= 0){
            
            //没有更新
            if (CheckDelegate) {
                
                [CheckDelegate Tool_CheckVersionDelegate_HaveNoVersion];
            }
            
            return;
        }
        
        //当前版本号
        NSString *oldVersionNum = [NSString stringWithFormat:@"%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]];
        NSLog(@"当前版本号：%@",oldVersionNum);
        
        //apple服务器版本号
        NSString *newVersionNum = [[resultArray objectAtIndex:0] objectForKey:@"version"];
        NSLog(@"服务器版本号：%@",newVersionNum);
        
        //当前版本号与apple服务器版本号不一致时更新
        if(![oldVersionNum isEqualToString: newVersionNum])
        {
            //有更新
            if (CheckDelegate) {
                
                [CheckDelegate Tool_CheckVersionDelegate_HaveNewVersion];
            }
            
        }else{
            
            //没有更新
            if (CheckDelegate) {
                
                [CheckDelegate Tool_CheckVersionDelegate_HaveNoVersion];
            }
        }
        
    }];
    
    //失败回调
    [request setFailedBlock:^(){
                
        //网络错误
        if (CheckDelegate) {
            [CheckDelegate Tool_CheckVersionDelegate_NetWorkFaild];
        }
        
    }];
    */
}

//中文转码
//URL带中文转码：
//NSString* escapedURLString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
- (NSString*)encodeUrl:(NSString*)urlStr{
    
    NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,  (CFStringRef)urlStr,  NULL, NULL,kCFStringEncodingUTF8);
    
    return encodedString;
}

//比较字符串中是否含有子字符串
- (BOOL)CheckStrTo:(NSString*)str1 With:(NSString*)str2{
    
    //将rangeOfString:发送给一个NSString对象时，传递的参数时要查找的字符串。它会返回一个NSRange struct来告诉你一个与这个字符串相匹配的部分从哪里开始以及匹配上的字符个数。
    NSRange range=[str1 rangeOfString:str2];
    if(range.location!=NSNotFound){
        return true;
    }else{
        return false;
    }
}

//判断是否是中文
- (BOOL)checkChinese:(NSString*)str{
    
    BOOL status = YES;
    
    int length = [str length];
    
    for (int i=0; i<length; ++i)
    {
        NSRange range = NSMakeRange(i, 1);
        
        NSString *subString = [str substringWithRange:range];
        
        const char *cString = [subString UTF8String];
        
        if (strlen(cString) == 3){
            
            status = YES;
            
        }else{
        
            status = NO;
            
            break;
        }
    }

    return status;
}

//比较选择时间，是否比今天的时间大
- (BOOL)compareDateisBigThenNow:(NSString *)choiceStr{
    
    //设置时间格式：
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //获取当前系统时间：
    NSDate *date1 = [NSDate date];
    
    //转换时间
    NSDate *date2 = [dateFormatter dateFromString:choiceStr];
    
    //------判断--------------------//
    switch ([date1 compare:date2]) {
        case NSOrderedSame:         //相等
            return YES;
            break;
        case NSOrderedAscending:    //date1比date2小
            return NO;
            break;
        case NSOrderedDescending:   //date1比date2大
            return YES;
            break;
        default:                    //非法时间
            return NO;
            break;
    }
    //-----------------------------//
}


//过滤html标签
-(NSString *)filterHTML:(NSString *)html{
    
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    
    //过滤字符串
    //&middot &nbsp &mdash;
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&nbsp" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&middot;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&middot" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&mdash;" withString:@""];
    html = [html stringByReplacingOccurrencesOfString:@"&mdash" withString:@""];
    
    return html;
}

//剪切图片
- (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context， with the desired
    
    // new size
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    
    // Get the new image  the context
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    
    UIGraphicsEndImageContext();
    
    // Return the new image.
    
    return newImage;
}

//存储头像图片
- (void)saveImage:(UIImage*)tempImage
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    
    NSString* imageName = [NSString stringWithFormat:@"PersonIcon_%@.png",[[[Tool shareToolObj] getAccountInfo] objectForKey:@"userId"]];
    
    //Document路径
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
}

//获得头像路径
- (NSString*)getPersonIconPath{
    
    //图片名称
    NSString* imageName = [NSString stringWithFormat:@"PersonIcon_%@.png",[[[Tool shareToolObj] getAccountInfo] objectForKey:@"userId"]];
    
    //Document路径
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];

    return fullPathToFile;
}

//去往appStore
- (void)goToAppStore{

    //跳转APPStore
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:APP_DownloadURL,APPSTORE_ID]];
    [[UIApplication sharedApplication] openURL:url];
}

//下面这个函数的好处在于，获取到的布局区域不会随着 某某UIViewController的self.view.frame来改变，只与屏幕转向有关，与UIViewController无关。
//可以根据横屏还是竖屏，提前预知目标窗口区域大小
//不要看多了这么一整个函数，但是给多个UIViewController调用就很方便了。
//这一个函数，本人丢到自定义的公共文件去实现。当做全局函数，一般用global.h来声明接口，在global.m实现。
- (CGRect)getClientRect:(BOOL)isHorz{
    
    //判断屏幕顶部有没状态栏出现
    BOOL isStatusBarHidden = [[ UIApplication sharedApplication ]isStatusBarHidden];

    CGRect rcScreen = [[UIScreen mainScreen] bounds];//这个不会随着屏幕旋转而改变
    
    int status_height = isStatusBarHidden ? 0 :20;
    
    CGRect rcClient = rcScreen;
    
    if(isHorz){
        
        rcClient.size.width -= status_height;
        
    }else{
        
        rcClient.size.height -= status_height;
    }
    
    CGRect rcArea = rcClient;
    
    if(isHorz){
        
        rcArea.size.width = MAX(rcClient.size.width,rcClient.size.height);
        rcArea.size.height = MIN(rcClient.size.width,rcClient.size.height);
    }
    
    return rcArea;
}

//设置Nav样式
- (void)setNavigationStyle:(UINavigationBar*)bar{

    //设置扁平Nav
    //设置样式
    //UITextAttributeTextColor
    //UITextAttributeFont
    //UITextAttributeTextShadowOffset
    //UITextAttributeTextShadowColor
    //185 33 32
    //设置导航栏颜色
    
    UIColor * col = [[Tool shareToolObj] colorWithHexString:@"#272c34"];
    
    [bar configureFlatNavigationBarWithColor:col];
    
    [bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                 
                               //  COLOR(213, 38, 42, 255)
                                 [UIColor whiteColor],
                                 UITextAttributeTextColor,
                                 
                                 //[UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1],
                                 [UIColor whiteColor],UITextAttributeTextShadowColor,
                                 
                                 [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                 
                                 [UIFont fontWithName:@"ArialMT" size:FONTSIZE], UITextAttributeFont,
                                                                     nil]];

}

//获得当前的方向
- (BOOL)isCurrentHorz{
    
    //UIInterfaceOrientationPortrait
    //UIInterfaceOrientationPortraitUpsideDown
    //UIInterfaceOrientationLandscapeLeft
    //UIInterfaceOrientationLandscapeRight

    if ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft || [[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight) {
        
        return YES;
    
    }else{
    
        return NO;
    }
}

//时间戳转换为时间字符串
- (NSString*)TimespToString:(NSString*)Timesp{

    //NSTimeInterval tt = [Timesp longLongValue]/1000;
    
    NSTimeInterval tt = [Timesp longLongValue];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:tt];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    NSString *nowtimeStr = [formatter stringFromDate:confromTimesp];
    
    return nowtimeStr;
}

//带秒钟
- (NSString*)TimespToStringWithSecond:(NSString *)Timesp{

    NSTimeInterval tt = [Timesp longLongValue]/1000;
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:tt];
    
    NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    NSString *nowtimeStr = [formatter stringFromDate:confromTimesp];
    
    return nowtimeStr;
}

//---------------------------------------------------------//

//判断是否登录
- (BOOL)isLogin{

    BOOL status = NO;
    
    if ([[Tool shareToolObj] getAccountInfo]) {
        status = YES;
    }else{
        status = NO;
    }
    
    return status;
}

//查询省份
- (NSString*)selectProvince:(NSString*)Id{

    NSMutableString* ProvinceName = [NSMutableString stringWithCapacity:0];
    
    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@ where provinceCode = '%@'", ProvinceTable, Id];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* str = [set stringForColumn:@"provinceName"];
            [ProvinceName setString:str];
        }
        
    }];
    
    return ProvinceName;
}

//查询城市
- (NSString*)selectCity:(NSString*)Id{

    NSMutableString* Name = [NSMutableString stringWithCapacity:0];
    
    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@ where cityCode = '%@'", CityTable, Id];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* str = [set stringForColumn:@"cityName"];
            [Name setString:str];
        }
        
    }];
    
    return Name;
}

//查询地区
- (NSString*)selectZone:(NSString*)Id{

    NSMutableString* Name = [NSMutableString stringWithCapacity:0];
    
    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@ where zoneCode = '%@'", ZoneTable, Id];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* str = [set stringForColumn:@"zoneName"];
            [Name setString:str];
        }
        
    }];
    
    return Name;
}

//查询区域数组
- (NSMutableArray*)selectZoneWithCityId:(NSString*)CityId{

    __block NSMutableArray* ZoneArray = [NSMutableArray arrayWithCapacity:0];
    
    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@ where cityCode = '%@'", ZoneTable, CityId];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* _id = [set stringForColumn:@"_id"];
            NSString* zoneCode = [set stringForColumn:@"zoneCode"];
            NSString* zoneName = [set stringForColumn:@"zoneName"];
            NSString* cityCode = [set stringForColumn:@"cityCode"];
            
            ZoneModel* model = [[ZoneModel alloc] init];
            model._id = _id;
            model.zoneCode = zoneCode;
            model.zoneName = zoneName;
            model.cityCode = cityCode;
            
            [ZoneArray addObject:model];
        }
        
    }];
    
    return ZoneArray;
}

//查询所有的城市
- (NSMutableArray*)selectAllCity{

    __block NSMutableArray* CityArray = [NSMutableArray arrayWithCapacity:0];

    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@", CityTable];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* _id = [set stringForColumn:@"_id"];
            NSString* cityCode = [set stringForColumn:@"cityCode"];
            NSString* cityName = [set stringForColumn:@"cityName"];
            NSString* provinceCode = [set stringForColumn:@"provinceCode"];
            
            CityModel* model = [[CityModel alloc] init];
            model._id = _id;
            model.cityCode = cityCode;
            model.cityName = cityName;
            model.provinceCode = provinceCode;
            
            [CityArray addObject:model];
        }
        
    }];
    
    return CityArray;
}

//查询所有省份
- (NSMutableArray*)selectAllProvince{
    
   __block NSMutableArray* ProvinceArray = [NSMutableArray arrayWithCapacity:0];

    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@", ProvinceTable];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* _id = [set stringForColumn:@"_id"];
            NSString* provinceCode = [set stringForColumn:@"provinceCode"];
            NSString* provinceName = [set stringForColumn:@"provinceName"];
            
            //省份model
            ProvinceModel* model = [[ProvinceModel alloc] init];
            model._id = _id;
            model.provinceCode = provinceCode;
            model.provinceName = provinceName;
            
            [ProvinceArray addObject:model];
        }
        
    }];
    
    return ProvinceArray;
}

//根据省份ID来查询城市
- (NSMutableArray*)selectCityInProvince:(NSString*)ProvinceId{

    __block NSMutableArray* CityArray = [NSMutableArray arrayWithCapacity:0];

    FMDatabaseQueue* queue = [FMDatabaseQueue databaseQueueWithPath:CITYDB_Path];
    
    [queue inDatabase:^(FMDatabase* db){
        
        //查询
        NSString* select_sql = [NSString stringWithFormat:@"select * from %@ where provinceCode = '%@'", CityTable,ProvinceId];
        
        FMResultSet* set = [db executeQuery:select_sql];
        
        while ([set next]) {
            
            NSString* _id = [set stringForColumn:@"_id"];
            NSString* cityCode = [set stringForColumn:@"cityCode"];
            NSString* cityName = [set stringForColumn:@"cityName"];
            NSString* provinceCode = [set stringForColumn:@"provinceCode"];
            
            CityModel* model = [[CityModel alloc] init];
            model._id = _id;
            model.cityCode = cityCode;
            model.cityName = cityName;
            model.provinceCode = provinceCode;
            
            [CityArray addObject:model];
        }
        
    }];
    
    return CityArray;
}

//获得本地上传的图片路径
- (NSString*)GetUploadImagePath{

    //路径数组
    NSArray* pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    //文档路径
    NSString* doc_Path = [pathsArray objectAtIndex:0];

    //图片名称路径
    NSString* image_Path = [doc_Path stringByAppendingPathComponent:IMAGE_NAME];
    
    return image_Path;
}

//图片存入本地
- (void)SaveImageInTheDefaultPath:(UIImage*)image{

    //--------转换为NSData------------------------//
//    NSData* data;
//    if (UIImagePNGRepresentation(image) == nil) {
//        data = UIImageJPEGRepresentation(image, 0.5);
//    } else {
//        data = UIImagePNGRepresentation(image);
//    }

    //压缩 0.8
    NSData* data = UIImageJPEGRepresentation(image, 0.8);
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    
    NSString* filePath = [self GetUploadImagePath];
    
    //NSLog(@"%@",filePath);
    
    //将图片保存为JPEG格式
    [fileManager createFileAtPath:filePath contents:data attributes:nil];
}

//选择图片方向
- (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation{
    
    long double rotate = 0.0;
    CGRect rect;
    float translateX = 0;
    float translateY = 0;
    float scaleX = 1.0;
    float scaleY = 1.0;
    
    switch (orientation) {
        case UIImageOrientationLeft:
            rotate = M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = 0;
            translateY = -rect.size.width;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationRight:
            rotate = 3 * M_PI_2;
            rect = CGRectMake(0, 0, image.size.height, image.size.width);
            translateX = -rect.size.height;
            translateY = 0;
            scaleY = rect.size.width/rect.size.height;
            scaleX = rect.size.height/rect.size.width;
            break;
        case UIImageOrientationDown:
            rotate = M_PI;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = -rect.size.width;
            translateY = -rect.size.height;
            break;
        default:
            rotate = 0.0;
            rect = CGRectMake(0, 0, image.size.width, image.size.height);
            translateX = 0;
            translateY = 0;
            break;
    }
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    //做CTM变换
    CGContextTranslateCTM(context, 0.0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextRotateCTM(context, rotate);
    CGContextTranslateCTM(context, translateX, translateY);
    
    CGContextScaleCTM(context, scaleX, scaleY);
    //绘制图片
    CGContextDrawImage(context, CGRectMake(0, 0, rect.size.width, rect.size.height), image.CGImage);
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    
    return newPic;
}

//-----------------场馆模块方法-------------------------//

//存储城市数据
- (void)saveVenuesCity:(CityModel*)tempModel{

    NSString* _id = tempModel._id;
    NSString* cityCode = tempModel.cityCode;
    NSString* cityName = tempModel.cityName;
    NSString* provinceCode = tempModel.provinceCode;

    NSDictionary* dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          _id,@"_id",
                          cityCode,@"cityCode",
                          cityName,@"cityName",
                          provinceCode,@"provinceCode",
                          nil];
    
    //保存数据
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"VenuesCityDict"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

//获得城市数据
- (CityModel*)getCityModel{

    NSDictionary* dict = [[NSUserDefaults standardUserDefaults] objectForKey:@"VenuesCityDict"];
    if (dict) {
        
        NSString* _id = [dict objectForKey:@"_id"];
        NSString* cityCode = [dict objectForKey:@"cityCode"];
        NSString* cityName = [dict objectForKey:@"cityName"];
        NSString* provinceCode = [dict objectForKey:@"provinceCode"];
    
        CityModel* objModel = [[CityModel alloc] init];
        objModel._id = _id;
        objModel.cityCode = cityCode;
        objModel.cityName = cityName;
        objModel.provinceCode = provinceCode;
        
        return objModel;
    
    }else{
    
        CityModel* objModel = [[CityModel alloc] init];
        objModel._id = @"";
        objModel.cityCode = @"610100";
        objModel.cityName = @"西安";
        objModel.provinceCode = @"";
        
        return objModel;
    }
}

//------------计算当前星期几-------------------------------//

//计算星期
- (int)getMonthWeekday:(CFGregorianDate)date
{
	CFTimeZoneRef tz = CFTimeZoneCopyDefault();
	CFGregorianDate month_date;
	month_date.year=date.year;
	month_date.month=date.month;
	month_date.day=date.day;
	month_date.hour=0;
	month_date.minute=0;
	month_date.second=1;
	return (int)CFAbsoluteTimeGetDayOfWeek(CFGregorianDateGetAbsoluteTime(month_date,tz),tz);
}

//输入年 月 日-----来计算获取日期
- (NSString *)getWeek:(NSInteger)year month:(NSInteger)month day:(NSInteger)day{
    
    CFAbsoluteTime	currentTime=CFAbsoluteTimeGetCurrent();
    CFGregorianDate currentSelectDate=CFAbsoluteTimeGetGregorianDate(currentTime,CFTimeZoneCopyDefault());
    currentSelectDate.year = year;
    currentSelectDate.month = month;
    currentSelectDate.day = day;
    
    NSInteger x = [self getMonthWeekday:currentSelectDate];
   
    //NSLog(@"xxxxx =%d", x);
    
	switch (x) {
        case 0:
            return @"星期日";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        case 7:
            return @"星期日";
            break;
        default:
            break;
    }
    return @" ";
}

//获得当前年份
- (NSInteger)getCurrentYear{

    //获取当前时间
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:now];
    
    int year = [dateComponent year];

    return year;
}

//获得运动的名称
- (NSString*)getSportName:(NSString*)sport_type{
    
    NSString* sportName = @"其他";
    
    NSArray* sportNameArray = [NSArray arrayWithObjects:@"篮球",@"足球",@"羽毛球",@"网球",@"乒乓球",@"台球",@"电子竞技",@"健身",@"游泳",@"跆拳道",@"射箭",@"赛车",@"排球",@"冰雪",@"棋牌",@"户外",@"粉丝团",@"橄榄球",@"曲棍球",@"保龄球",@"其他", nil];
    
    NSArray* sport_typeArray = [NSArray arrayWithObjects:@"100",@"101",@"102",@"105",@"103",@"104",@"106",@"108",@"109",@"110",@"111",@"112",@"113",@"114",@"115",@"116",@"117",@"118",@"119",@"120",@"107",nil];
    
    NSInteger Index = 0;
    
    //遍历数组，获得下标
    for (NSInteger i = 0; i < [sport_typeArray count]; i++) {
        
        NSString* temp_type = [sport_typeArray objectAtIndex:i];
        
        if ([temp_type isEqualToString:sport_type]) {
            
            Index = i;
        }
    }
    
    //匹配字符串
    if ([sport_type isEqualToString:@""]) {
        sportName = @"其他";
    }else{
        sportName = [sportNameArray objectAtIndex:Index];
    }
    
    //大于120以上为其他
    if ([sport_type integerValue] > 120) {
        sportName = @"其他";
    }
    
    return sportName;
}

//计算天数差
- (NSString*)compareCurrentTime:(NSString*)compareDate{

//    NSLog(@"%@", compareDate);
    //实例化一个NSDateFormatter对象
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date =[dateFormat dateFromString:compareDate];
    
    NSTimeInterval  timeInterval = [date timeIntervalSinceNow];
//    timeInterval = +timeInterval;
    
    double time = timeInterval/60/60/24;
    
    if (time > 1)
    {
        time++;
    }
    
    NSString *result = [NSString stringWithFormat:@"%d",(int)time];
    
    return  result;
}

@end
