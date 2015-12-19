
//***************辅助头文件***************//

#ifndef yyzhaofang_config_h
#define yyzhaofang_config_h

//标签栏高度
#define TabBar_HEIGHT 49

//NavBar高度
#define NavigationBar_HEIGHT 44

//导航的字体大小
#define FONTSIZE 20

//默认的字体 FZLTXHJW--GB1-0
#define DefaultFont(a)  [UIFont fontWithName:@"FZLTXHJW--GB1-0" size:a];

//一行书架的尺寸
#define BookSize CGSizeMake(1024 - 145, 240)

//左边导航大小
#define Dock_Rect CGRectMake(0, 0, 150, 748)

//右边内容区域大小
#define Content_Rect CGRectMake(145, 0, 1024 - 145, 748)

//模态窗口尺寸
#define Model_Rect CGRectMake(0, 0, 540, 600)

//Item尺寸大小
#define DockItem_Size CGSizeMake(150, 60)

//屏幕设计大小
#define MAINRECT CGRectMake(0, 0, 1024, 768)

//app的主色
#define MAINCOLOR  [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]

//背景颜色
#define BACKGROUND_COLOR [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.000]  

//视网膜屏
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//定义宏判断ios7
#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

//iPhone5以上
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//是否是iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//浮点型
#define COLOR_FLOAT(R, G, B, A) [UIColor colorWithRed:R green:G blue:B alpha:A]

//安全删除对象
#define SAFE_DELETE(P) if(P) { [P release], P = nil; }

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])

//NSUserDefaults 实例化
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

//--------------------------------------------------------------//

// 系统版本是否大于7.0
#define K_iOS_System_Version_Gt_7   ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)

// 判断是否使用了ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

// 区分模拟器和真机
#if TARGET_OS_IPHONE
//iPhone Device
#elif TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

// 判断是否为iPhone5
#define K_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

// 获取当前Language
#define K_Current_Language ([[NSLocale preferredLanguages] objectAtIndex:0])

// 后台执行block
#define K_Dispatch_In_Back_Block(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

// 主线程中执行block
#define K_Dispatch_In_Main_Block(block) dispatch_async(dispatch_get_main_queue(),block)

// 只执行一次的block
#define K_Dispatch_Once_Block(block) static dispatch_once_t onceToken;\
dispatch_once(&onceToken, block);

// 发布后屏蔽NSLog的日志输出
#if defined (DEBUG) && DEBUG == 1
#else
//#define NSLog(...) {};
#endif

/************************定义API******************************/

//官网网站 : http://www.chinago.cn/
//测试账号
//账号：lzafa@126.com
//密码：xiepeng777

//-----------------------------------------------------//

#define AppType_PersonAlbum @"1"
#define AppType_TeamAlbum @"2"
#define AppType_OrganizationAlbum @"3"
#define AppType_TeamSpaceIcon @"4"
#define AppType_PesonIcon @"5"
#define AppType_OrganizationLogo @"6"
#define AppType_OrganizationBigBanner @"7"
#define AppType_MatchAlbum @"8"

/*中间层服务地址*/
//1.	账户管理CG01模块所有接口
//2.	个人模块CG02模块中相册部分所有接口，以及个人主页中CG020301-CG020305接口
#define CHINAGO_SERVER_URL_SERVICE @"http://114.113.159.57:7008/chinago/service"
//手机验证码
#define CHINAGO_GETCODE_URL_SERVICE @"http://114.113.159.57:7008/chinago/getcode"
//#define CHINAGO_SERVER_URL_SERVICE @"http://114.113.159.52:7001/chinago/service"


/*中间层服务地址*/
//其余所有接口采用第二种方式
#define CHINAGO_SERVER_URL_INTERFACE @"http://114.113.159.57:7008/chinago/interface"
//#define CHINAGO_SERVER_URL_INTERFACE @"http://114.113.159.52:7001/chinago/interface"

//积分赛事URL
#define CHINAGO_SERVER_URL_JF @"http://114.113.159.57:7008/chinago/servlet"
//#define CHINAGO_SERVER_URL_JF @"http://114.113.159.52:7001/chinago/servlet"


/*中间层服务文件上传地址*/
//    1-	个人相册
//    2-	团队相册
//    3-	机构相册
//    4-	团队空间队徽
//    5-	个人头像
//    6-	机构LOGO
//    7-	机构大图
//    8-	机构相册

#define CHINAGO_SERVER_URL_UPFILE @"http://114.113.159.57:7008/chinago/an/uploadimg.action"
//#define CHINAGO_SERVER_URL_UPFILE @"http://114.113.159.52:7001/chinago/an/uploadimg.action"

/** 其他人个人头像图片地址 */
#define CHINAGO_SERVER_NAMESPACE @"http://i1.chinago.cn/upload/data1/sns/photo/"

/** 空间相册图片地址 */
#define CHINAGO_SERVER_IMG_TEAM_PHOTO @"http://i1.chinago.cn/upload/data1/sns/team/photo/"

/** 个人头像图片地址 */
#define CHINAGO_SERVER_IMG_FACE @"http://i1.chinago.cn/upload/data1/sns"

//积分赛头像路径
//#define Pointrace_Face_URL @"http://114.113.159.57:7008/chinago/servlet/PhotoUpload/"
#define Pointrace_Face_URL @"http://home.chinago.cn/badminton/"

//CCL 资讯图片http://i1.chinago.cn/upload/data1/sns/pdata/
#define GetCCLnewsImg_URL @"http://home.chinago.cn/ccl2015/"
#define GetCCLMatchPerImg_Url @"http://i1.chinago.cn/upload/data1/sns/pdata/"

//CCL RED个人头像
#define GetCCLREDPer_Img_Url @"http://home.chinago.cn/china_player/picfile/photo/"


/***************积分赛个人积分*****************/
#define GetTournament_funcId @"CG120002";

//测试用地址

#define CHINAGO_SERVER_URL_CESHI @"http://192.168.2.71:8080/chinago/interface"
/** 场馆图片地址 */
#define CHINAGO_SERVER_IMG_GAUNTLET @"http://i1.chinago.cn/upload/data1/sns/gym/"

/** 赛事图片地址 */
#define CHINAGO_SERVER_IMG_EVENT @"http://i1.chinago.cn/upload/data1/sns/league/league_logo/"

/*赛事参赛团队图片地址*/
#define CHINAGO_SERVER_IMG_EVENT_TEAM @"http://i1.chinago.cn/upload/data1/sns/league/team/"

/*机构图片头像地址*/
#define CHINAGO_SERVER_IMG_AGENCY @"http://i1.chinago.cn/upload/data1/sns/club/icon/"

/** 机构相册图片地址*/
#define CHINAGO_SERVER_IMG_AGENCY_PHOTO @"http://i1.chinago.cn/upload/data1/sns/club/photo/"

/*咨讯图片地址*/
#define CHINAGO_SERVER_IMG_NEWS @"http://gz.chinago.cn/upload_files/"

/*团队图片地址*/
#define CHINAGO_SERVER_IMG_TEAM @"http://i1.chinago.cn/upload/data1/sns/team/icon/"
//#define CHINAGO_SERVER_IMG_TEAM @"http://i1.chinago.cn/www/team/"
/** 机构图片大图地址 */
#define CHINAGO_SERVER_IMG_AGENCY_BANNER @"http://i1.chinago.cn/upload/data1/sns/club/banner/"

//--------------------个人模块图片路径---------------

//个人头像页面
//三种尺寸
//其他用户头像使用 50的尺寸
#define Size_120 @"_120.jpg"
#define Size_80  @"_80.jpg"
#define Size_50  @"_50.jpg"

//头像路径
#define Person_Face_URL @"http://i1.chinago.cn/upload/data1/sns"

//个人相册封面
#define PersonAlbum_URL @"http://i1.chinago.cn/upload/data1/sns/photo/"

//个人相册内容照片
#define PhotoSmall @"small_"
#define PhotoBig @"big_"
#define PersonAlbumDetail_URL @"http://i1.chinago.cn/upload/data1/sns/photo/"

//i足球图片地址
#define IfootballImage_URL @"http://home.chinago.cn/posts/"

//-----------------------接口参数----------------------------

//判断登入用户是否是赛事、团队、机构成员
//{
//    “funcId”:”CG000003”,
//    “uid”:”100003”,
//    “id”:”4690”       //赛事、团队、机构id
//    “type”:”0”        0-	赛事  1-	团队  2-	机构
//}
#define Members_funcId @"CG000003"

//登录接口CG010001
//username
//password
#define Login_funcId @"CG010001"

//找回密码接口CG010002
//email
#define FindPassWord_funcId @"CG010002"

////注册用户CG010003
//"funcId": "CG010003",
//"email": "liyunjiang@gmail.com",
//"password": "123456",
//"name": "张三",
//"gender": "M",
//"birthday": "19880920",
//"city_id": "21",
//"current_status ": "W",
//"privacy": "",
//"invite_code": ""
#define Register_funcId @"CG010003"

#define RegisterTel_FuncId @"CG010009"
////检测email是否可注册接口CG010004
//"funcId": "CG010004",
//"email": "liyunjiang@gmail.com"
#define InspectEmail_funcId @"CG010004"

////修改用户基本信息接口CG010005
//"funcId": "CG010005",
//"uid": "100003",
//"name": "谢鹏",
//"mood": "很开心",
//"mood_image": "/pages/sex.imgae",
//"gender": "M",
//"birthday": "19800730",
//"birthcity_id": "43001",
//"city_id": "43001",
//"body_form": "1",
//"blood_type": "B",
//"married": "S",
//"current_status": "W",
//"privacy": "仅好友可见",
//"intro ": "我是happy"
#define ModifyUserInformation_funcId @"CG010005"

////修改用户联系方式接口CG010006
//"funcId": "CG010006",
//"uid": "100003",
//"city_id": "43001",
//"zip": "邮编",
//"mobile ": "B",
//"qq": "S",
//"msn": "W",
//"privacy": "仅好友可见"
#define ModifyUserContactStyle_funcId @"CG010006"

//修改用户密码接口CG010007
//"funcId": "CG010007",
//"uid": "100003",
//" oldpassword ": "123465"，
//"password": "123465"
#define ModifyUserPassWord_funcId @"CG010007"

////修改用户头像接口CG010008
//"funcId": " CG010008",
//"uid": "100004",
//" face_folder ": "/photos/20130822/jpg/20130822021659939.jpg "
#define ModifyUserPhoto_funcId @"CG010008"

//用户信息反馈接口CG010009
//tel
//qq
//content
#define FeedBack_funcId @"CG010009"

//--------------------------相册接口------------------------------

//获取相册接口CG020101
//{"funcId":" CG020101","uid":"100002"}
#define GetUserAlbum_funcId @"CG020101"

////新建相册接口CG020102
//{"funcId":" CG020102","uid":"10011","name":"自拍","privacy ":"A"," password ":"123","face_photo ":"1","order":""}
#define CreateUserAlbum_funcId @"CG020102"

////往相册上传图片接口CG020103
//{"funcId":" CG020103","uid":"100004","name":"我","file ":"/photos/20130822/jpg/adb.jpg"," description ":"我的最爱"," aid ":"330496"}
#define UploadImageToUserAlbum_funcId @"CG020103"

////查看相册接口CG020104
//{"funcId":" CG020104","aid":"1","uid":"100002"}
#define FindUserAlbumDetail_funcId @"CG020104"

////修改相册中照片信息接口CG020105
//{"funcId":" CG020105","id":"10011"," uid ":""," name ":"10011"," description ":""," is_audit ":"1"}
#define ModifyUserAlbumPictureInformation_funcId @"CG020105"

////修改相册信息接口CG020106
//{"funcId":" CG020106","aid":"10011"," uid ":"","order":"10011","name ":"","privacy ":"10011"," password ":"","face_photo":""}
#define ModifyUserAlbumInformation_funcId @"CG020106"

////删除相册接口CG020107
//{"funcId":" CG020107","aid":"10011"," uid ":""}
#define DeleteUserAlbum_funcId @"CG020107"

////删除照片接口CG020108
//{"funcId":" CG020108","id":"10011"," uid ":""}
#define DeleteUserAlbumPicture_funcId @"CG020108"

////获取好友照片接口CG020109
//{"funcId":"CG020109","uid":"100003"}
#define GetFriendAlbum_funcId @"CG020109"

//----------------------日记接口-------------------------------

//获取我的日志分类列表接口CG020201
//"funcId":" CG020201",
//" uid ":"100004"
#define GetUserLogCategoryList_funcId @"CG020201"

//获取某分类下日志剪辑列表接口CG020202
//{
//    "funcId":"CG020202",
//    " pageSize ":"10",
//    " currentPage ":"1",
//    " gid ":"1",
//    " uid ":"100023"
//}
#define GetUserLogCategoryDetailList_funcId @"CG020202"

//获取日志详情接口CG020203
//{
//    "funcId":" CG020203",
//    " did ":"1"
//}
#define GetLogDetail_funcId @"CG020203"

//添加日志分类接口CG020204
//{
//    "funcId":" CG020204",
//    "uid":"100004",
//    " name ":"艳照1",
//    " priv ":"A"
//}
#define AddLogCategory_funcId @"CG020204"

//删除日志分类接口CG020205
//{
//    "funcId":" CG020205",
//    "uid":"100004",
//    "gid":"1098951"
//}
#define DeleteLogCategory_funcId @"CG020205"

////写日志接口CG020206
//funcId	CG020206
//content	含html标签
//gid		分类id
//mood_desc	心情文字
//mood_icon	心情图片
//priv		权限
//status	状态	F为最终保存，T为草稿
//title		标题
//uid		用户id
//weather	天气
//friends	提到的好友id	多个好友id，以“，”分开
#define WriteLog_funcId @"CG020206"

//删除日记接口CG020207
//{
//    "funcId":" CG020207",
//    "uid":"100004",
//    "did":"35513"
//}
#define DeleteLog_funcId @"CG020207"

//修改日记接口CG020208
#define ModifyLog_funcId @"CG020208"

//查看好友日记接口CG020209
//{
//    "funcId":" CG020209",
//    "pageSize":" 10",
//    "currentPage":" 1",
//    "uid":"100003"
//}
#define FindFriendLog_funcId @"CG020209"

//----------------------个人主页接口-------------------

////个人主页接口CG020301
//{"funcId":" CG020301","uid":"100004"}
#define UserHomePage_funcId @"CG020301"

//发表心情接口CG020302
//{"funcId":" CG020302","uid":"10011","mood_image":"xx","mood ":"很开心"}
#define WriteUserMood_funcId @"CG020302"

//获取我的团队接口CG020303
//{
//    "funcId":" CG020303",
//    " uid ":" 589294"
//}
#define GetMyTeam_funcId @"CG020303"

//获取好友动态列表接口CG020304
//{
//    "funcId":" CG020304",
//    " uid ":"100004"
//}
#define GetFriendActivity_funcId @"CG020304"

//查看好友动态详情接口CG020305
#define FindFriendActivityDetail_funcId @"CG020305"

//留言接口CG020306
//{
//    "funcId":" CG020306",
//    "uid ":"100004",
//    "a_uid":" 100003",
//    "is_secret":"0",
//    "content":"我来踩踩你"
//}
#define SendMessageToFriend_funcId @"CG020306"

//回复留言接口CG020307
//{
//    "funcId":"CG020307",
//    "uid":"100003",
//    "suid":"100004",
//    "id":"58297"
//    "content":"100004"
//}
#define ReplyMessage_funcId @"CG020307"

//获取留言列表接口CG020308
//{
//    "funcId":"CG020308",
//    "uid":"100004"
//}
#define GetMessage_funcId @"CG020308"

//获取我的好友列表CG020309
//{
//    "funcId":"CG020309",
//    "uid":"100004"
//}
#define GetMyFriendList_funcId @"CG020309"


//--------------------消息接口----------------------

//消息接口CG020401
//{"funcId":" CG020401",uid ":"100004"}
#define GetMessageList_funcId @"CG020401"

//收件箱接口CG020402
//{"funcId":" CG020402","uid ":"100004"}
#define InboxMessageList_funcId @"CG020402"

//收件箱查看接口CG020403
//{"funcId":" CG020403",smid":"2761097"}
#define InboxMessageDetail_funcId @"CG020403"

//收件箱回复接口CG020404
//{
//"funcId":" CG020404",
//"smid":"2761097",
//"suid ":"100003",
//"ruid ":"100004",
//"content ":"打篮球还是兵乓球呢？亲"
//}
#define InboxReplyMessage_funcId @"CG020404"

//收件箱删除接口CG020405
//{
//    "funcId":" CG020405",
//    "id":"1"
//}
#define InboxDeleteMessage_funcId @"CG020405"

////发件箱接口CG020406
//{"funcId":" CG020406","uid ":"100003"}
#define SendBoxMessageList_funcId @"CG020406"

//发件箱删除接口CG020407
//{
//    "funcId":" CG020407",
//    "id":"1"
//}
#define SendBoxDeleteMessage_funcId @"CG020407"

////写短消息接口CG020408
//{
//    "funcId":" CG020408",
//    "suid ":"100004",
//    "ruid ":"100003",
//    "content ":"明天打球么？"
//}
#define SendBoxWriteMessage_funcId @"CG020408"

//查看系统消息接口CG020409
//{
//    "funcId":" CG020409",
//    "uid":"100004"
//}
#define FindSystemNewsList_funcId @"CG020409"

//获取评论接口（别人给我的评论）CG020410
////{
//"funcId":" CG020410",
//" uid ":"100004"
//}
#define GetCommentListToMe_funcId @"CG020410"

//回复评论接口CG020411
//{
//    "funcId":" CG020411",
//    " sid ":"1",
//    " suid ":"100003",
//    "uid":"100004",
//    "appid":"12",
//    "content":"楼上的你牛人"
//}
#define ReplyComment_funcId @"CG020411"

//获得评论回复接口（我给别人的评论及回复）CG020412
//{
//    "funcId":" CG020412",
//    " uid ":"100004"
//}
#define GetCommentListToOtherPeople_funcId @"CG020412"

//获得团队回复接口CG020413
//{
//    "funcId":" CG020413",
//    " uid ":"100004"
//}
#define GetTeamReplyList_funcId @"CG020413"

//--------------------记录接口-----------------

//获取我的记录列表接口CG020501
//{
//    "funcId":" CG020501",
//    " uid ":"100003",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetMyRecordList_funcId @"CG020501"

//获取好友记录列表接口CG020502
//{
//    "funcId":" CG020501",
//    " uid ":"100003",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetMyFriendRecordList_funcId @"CG020502"

//编辑记录接口CG020503
//{
//    "funcId":" CG020503",
//    " note_id ":"33532",
//    " content ":"天天向上",
//    "deleted ":"N"   Y表示删除
//}
#define EditRecord_funcId @"CG020503"

//评论记录接口CG020504
//{
//    "funcId":" CG020504",
//    "uid ":"100004",
//    "a_uid":" 100003",
//    "is_secret":"0",
//    "tid":"33534",
//    "content":"恭喜恭喜"
//}
#define CommentToRecord_funcId @"CG020504"

//保存记录接口CG020505
//{
//    "funcId":" CG020505",
//    "uid":"100004",
//    "content":"廉价劳动力有木有"
//}
#define SaveRecord_funcId @"CG020505"

//-----------------------赛事接口----------------------

//创建赛事接口CG030101
//{
//    "funcId":" CG030101",
//    " uid ":"100003",
//    " city ":"430001",
//    " league_name ":"湖南长沙足球联赛",
//    " domain ":" eclipseWu",
//    " organizer ":"湖南中医药大学",
//    " aidancer ":"湖南商学院",
//    " league_type ":"football",
//    " match_type ":"1",
//    " loop_type ":"1",
//    " team_num ":"5",
//    " people_num ":"11",
//    " group_num ":"1",
//    "signup_end_date":" 2013-09-21",
//    " start_date ":"2013-10-10",
//    " end_date ":"2014-01-10",
//    " contact ":"张玉东",
//    " telephone ":" 18627565223",
//    " qq ":"972293570"
//}
#define CreateMatch_funcId @"CG030101"

//获取赛事列表接口CG030103
//{
//    "funcId":" CG030103",
//    " city ":"430001",
//    " league_type ":"football",
//    " league_progress ":"0",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetMatchList_funcId @"CG030103"
#define GetMyOrg_funcId @"CG140019"
//获取我的约战列表接口CG050105
//{
//    "funcId":" CG050105",
//    " city ":"430001",
//    " league_type ":"football",
//    " league_progress ":"0",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetFightingList_funcId @"CG050105"

//4.3.1.4	获取赛事基本信息接口CG030104
//{
//    "funcId":" CG030104",
//    " uid ":"100003",
//    " league_id ":"10"
//}
#define GetMatchDetailInfo_funcId @"CG030104"

//4.3.1.5	获取参赛团队接口CG030105
//{
//    "funcId":" CG030105",
//    " uid ":"100003",
//    " league_id ":"470"
//}
#define GetMatchTeamList_funcId @"CG030105"

//4.3.1.6	获取赛事报道接口CG030106
#define GetMatchReport_funcId @"CG030106"

//4.3.1.7	获取官方消息接口CG030107
//{
//    "funcId":" CG030107",
//    " uid ":"100003",
//    " league_id ":"15"
//}
#define GetOfficialNews_funcId @"CG030107"

//4.3.1.8	查看赛事报道、官方消息详情CG030108
//{
//    "funcId":" CG030108",
//    " uid ":"110260",
//    " le_id ":"15",
//    " tid ":"18741"
//}
#define FindReportOrOfficialNewsDetail_funcId @"CG030108"

//4.3.1.9	点击报名参赛接口CG030109
//{
//    “funcId”:” CG030108”,
//    “ uid “:” 493179”,
//    “ le_id “:”3414”
//}
#define ImmediatelyApplyMatch_funcId @"CG030109"

//4.3.1.10	立即报名接口CG030110
//{
//    "funcId":"CG030110",
//    "t_full_name":"测试11111",
//    "le_id":"3414",
//    "t_id":"19963",
//    "contact_name":"张三",
//    "phone1":"18627565225",
//    "t_domain":"lzvone2008",
//    "signup_uid":"493179"
//}
#define GoToApplyMatch_funcId @"CG030110"

//--------------------赛程和赛果接口-----------------------

//获取赛程列表接口CG030201
//{
//    "funcId":" CG030201",
//    " uid ":"100003",
//    " le_id ":"3047",
//    " stage_id ":"2906",
//    " group_id ":"1",
//    " type ":"all_match"
//}
#define GetScheduleList_funcId @"CG030201"

//----------------------积分接口-------------------------

//4.3.3.1	获取赛事积分列表接口CG030301
//{
//    "funcId":" CG030301",
//    " uid ":"100003",
//    " le_id ":"3047",
//    " stage_id ":"2906",
//    " group_id ":"1"
//}
#define GetMatchScoreList_funcId @"CG030301"

//----------------------参赛队伍接口---------------------

//获取参赛团队接口CG030401
//{
//    "funcId":" CG030401",
//    " uid ":"100003",
//    " le_id ":"3041",
//    " stage_id ":"",
//    " group_id ":""
//}
#define GetEntryTeamList_funcId @"CG030401"

//获取团队成员接口CG030402
//{
//    "funcId":" CG030402",
//    " uid ":"100003",
//    " le_id ":" 3041 ",
//    " t_id ":" 19479 "
//}
#define GetEntryTeamMemberList_funcId @"CG030402"

//---------------------团队讨论区接口------------------------

//4.3.5.1	发帖接口CG030501
//{
//    "funcId":" CG030501",
//    " uid ":"100003",
//    " le_id ":"3014",
//    " subject ":" 今天是国庆第6天",
//    " display_order ":"1",
//    " news_class ":"news",
//    " content ":"国庆7天假，天天有惊喜",
//    " isshare ":"1",
//    " quintessence ":"0"
//}
#define SendTeamBBS_funcId @"CG030501"


//积分赛报名接口
#define Point_funcId @"CG120001"

//4.3.5.2	回帖接口CG030502
//{
//    "funcId":" CG030502",
//    "uid":"100004",
//    "subject":"回复：今天是国庆第6天",
//    "content":"是啊，时间过的好快哟",
//    "tid":"54777",
//    "le_id":"3014"
//}
#define ReplyTeamBBS_funcId @"CG030502"


//4.3.5.3	编辑帖接口CG030503
//{
//    "funcId":" CG030503",
//    "uid ":"100003",
//    "tid ":" 54777",
//    "subject ":"笑嘻嘻",
//    "content":"笑嘻嘻"
//    "display_order":"0",
//    "quintessence ":"0"
//}
#define EditTeamBBS_funcId @"CG030503"


//4.3.5.4	获取帖子列表接口CG030504
//{
//    "funcId":" CG030504",
//    " uid ":"100003",
//    " le_id ":"3041",
//    " type ":"0",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetTeamBBSList_funcId @"CG030504"


//4.3.5.5	获取帖子详情及回复接口CG030505
//{
//    "funcId":" CG030505",
//    " uid ":"100003",
//    " tid ":"55414",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetTeamBBSDetail_AndReply_funcId @"CG030505"


//4.3.5.6	编辑回帖接口CG030506
//{
//    "funcId":" CG030506",
//    " uid ":"100003",
//    " pid ":"100003",
//    " subject ":"回复：xxx",
//    " content ":"笑嘻嘻速度"
//}
#define EditTeamReply_funcId @"CG030506"


//4.3.5.7	删除回帖接口CG030507
//{
//    "funcId":" CG030507",
//    " uid ":"100003",
//    " pid":"1"
//}
#define DeleteTeamReply_funcId @"CG030507"


//-------------------赛事相册接口------------------//

//4.3.6.1	新建相册接口CG030601
//{
//    "funcId":" CG030601",
//    " uid ":"100003",
//    " le_id ":"3041",
//    " name ":"彩排",
//    " description ":""
//}
#define CreateNewMatchAlbum_funcId @"CG030601"

//4.3.6.2	编辑相册接口CG030602
//{
//    "funcId":" CG030602",
//    " uid ":"100003",
//    " aid ":"194143",
//    " vover ":"",
//    " description":"彩排222",
//    " name ":"彩排222"
//}
#define EditMatchAlbum_funcId @"CG030602"

//4.3.6.3	删除相册接口CG030603
//{
//    "funcId":" CG030603",
//    " uid ":"100003",
//    " aid ":" 194143"
//}
#define DeleteMatchAlbum_funcId @"CG030603"

//4.3.6.4	上传照片到相册接口CG030604
//{
//    "funcId":" CG030604",
//    " le_id ":" 100003 ",
//    " le_id ":" 3041 ",
//    " aid ":" 193973 ",
//    " name ":"zhongwu",
//    " description ":" ceshi ",d
//    " path ":" 0/0/f/12.jpg "
//}
#define UploadPhotoToMatchAlbum_funcId @"CG030604"

//4.3.6.5	编辑相册中照片接口CG030605
//{
//    "funcId":" CG030605",
//    " uid ":"100003",
//    " id ":"499006",
//    " name ":"DEG",
//    " description ":"信息"
//}
#define EditPhotoFromMatchAlbum_funcId @"CG030605"


//4.3.6.6	删除相册中照片接口CG030606
//{
//    "funcId":" CG030606",
//    " id ":"499006"
//}
#define DeletePhotoFromMatchAlbum_funcId @"CG030606"


//4.3.6.7	获取相册列表接口CG030607
//{
//    "funcId":" CG030607",
//    " uid ":"100003",
//    " le_id ":"3041",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetMatchAlbumList_funcId @"CG030607"

//4.3.6.8	获取照片列表接口CG030608
//{
//    "funcId":" CG030608",
//    " uid ":"100003",
//    " aid ":"194134",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetPhotoListFromMatchAlbum_funcId @"CG030608"

//4.3.6.9	获取相册分类列表接口CG030609
//{
//    "funcId":" CG030609",
//    " uid ":"100003",
//    " le_id ":"3401"
//}
#define GetMatchAlbumCategoryList_funcId @"CG030609"


//---------------赛事其他接口-----------------------

//4.3.7.1	获取赛事介绍、规则、赞助商接口CG030701
//{
//    "funcId":" CG030701",
//    " uid ":"100003",
//    " le_id ":"10",
//    " tag ":" intro "
//}
#define GetMatchIntroduce_Rule_Business_funcId @"CG030701"


//-------------------团队接口-----------------------

//4.4.1.1	创建团队接口CG040101
//{
//    "funcId":" CG040101",
//    " creater":"100003",
//    " creater_name ":"李四",
//    " type ":"100",
//    " name ":"足球基友",
//    " domain ":"eclipwer",
//    " tel ":"18627565223",
//    " city ":"430101",
//    " location ":"深圳万科",
//    " build_date ":"2013-9-14",
//    " kind ":"E",
//    " qq ":"972293570",
//    " slogan ":"友谊第一，比赛第二",
//    " path ":"photos/f/aa.img",
//    " content ":"计算机的覅假摔帝附加赛地方",
//    " right ":"0"
//}
#define CreateTeam_funcId @"CG040101"

//4.4.1.2	获取团队列表接口CG040102
//{
//    "funcId":" CG040102",
//    " type ":"101",
//    "sort_type":"0",
//    " pageSize ":"10",
//    " currentPage ":"1"
//}
#define GetTeamList @"CG040102"

//发起挑战接口CG040103(约战模块完善)
//{
//    “funcId”:” CG040103”,
//    “ uid “:”100003”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define CreateFighting_funcId @"CG040103"


//4.4.1.4	加入团队接口CG040104
//{
//    “funcId”:” CG040104”,
//    “ uid “:”100003”,
//    “ tm_id “:” 27678”,
//    “ vocation “:”M”,
//    “ reason “:”被邀请”
//}
#define JoinTeam_funcId @"CG040104"

//4.4.1.5	获取团队详细信息接口CG040105
//{
//    “funcId”:” CG040105”,
//    “ uid “:”100003”,
//    “ tm_id “:” 4690”
//}
#define GetTeamInformationDetail_funcId @"CG040105"

//4.4.1.6	获取公告列表接口CG040106
//{
//    “funcId”:” CG040106”,
//    “ uid “:”100003”,
//    “ tm_id “:”1”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetPublicNoticeList_funcId @"CG040106"

//4.4.1.7	获取公告详情接口CG040107
//{
//    “funcId”:” CG040107”,
//    “ id “:”968883”,
//    “ pageSize “:” 10”,
//    “ currentPage “:” 1”
//}
#define GetPublicNoticeDetailInfo_funcId @"CG040107"

//4.4.1.8	获取比赛预告接口CG040108(与历史战绩接口一样)
//{
//    “funcId”:” CG040108”,
//    “ uid “:”100003”,
//    “ tm_id “:”12”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetMatchNoticeList_funcId @"CG040108"

//4.4.1.9	获取历史战绩列表接口CG040109（与比赛预告类似）
//{
//    “funcId”:” CG040109”,
//    “ uid “:”100003”,
//    “ tm_id “:”12”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetHistoryFightRecordList_funcId @"CG040109"


//------------------团队信息接口---------------------

//4.4.2.1	获取团队基本信息接口CG040201
//{
//    “funcId”:” CG040201”,
//    “ uid “:”100003”,
//    “ tm_id “:”4690”
//}
#define GetTeamDetailInfo_funcId @"CG040201"

//------------------团队成员接口----------------------

//4.4.3.1	获取团队成员接口CG040301
//{
//    “funcId”:” CG040301”,
//    “ uid “:”100003”,
//    “ tm_id “:”100003”
//}
#define GetTeamMemberList_funcId @"CG040301"


//-------------------大事记接口----------------------

//4.4.4.1	获取大事记列表接口CG040401
//{
//    “funcId”:” CG040401”,
//    “ uid “:”100003”,
//    “ tm_id “:”4690”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetEventsList_funcId @"CG040401"


//4.4.4.2	获取大事记详情接口CG040402
//{
//    “funcId”:” CG040402”,
//    “ uid “:”100003”,
//    “ id “:””
//}
#define GetEventsDetailInformation_funcId @"CG040402"


//-------------------团队相册接口--------------------

//4.4.5.1	创建团队相册接口CG040501
//{
//    “funcId”:” CG040501”,
//    “uid”:”10011”,
//    “name”:”自拍”,
//    “tid “:”4690”
//}
#define CreateTeamAlbum_funcId @"CG040501"

//4.4.5.2	编辑团队相册接口CG040502
//{
//    “funcId”:” CG040502”,
//    “ uid “:”100003”,
//    “ aid “:”12”,
//    “ name “:”密码”,
//    “ face_photo “:”1”
//}
#define EditTeamAlbum_funcId @"CG040502"


//4.4.5.3	删除团相册接口CG040503
//{
//    “funcId”:” CG040503”,
//    “ uid “:”100003”,
//    “ aid “:”10”
//}
#define DeleteTeamAlbum_funcId @"CG040503"

//4.4.5.4	上传照片接口CG040504
//{
//    “funcId”:” CG040504”,
//    “ uid “:”100003”,
//    “ tid “:”27671”,
//    “ aid “:”223965”
//    “ name “:” 2007赛季全家福”,
//    “ description “:” 2007赛季全家福”,
//    “ file “:” 1/66/110019/_0125306001206029466.gif “
//}
#define UploadPhotoToTeamAlbum_funcId @"CG040504"


//4.4.5.5	编辑照片接口CG040505
//{
//    “funcId”:” CG040505”,
//    “ uid “:”100003”,
//    “ aid “:”100003”,
//    “ name “:”100003”,
//    “ id “:”10”
//}
#define EditPhotoFromTeamAlbum_funcId @"CG040505"


//4.4.5.6	删除照片接口CG040506
//{
//    “funcId”:” CG020501”,
//    “ uid “:”100003”,
//    “ id “:”10”
//}
#define DeletePhotoFromTeamAlbum_funcId @"CG040506"

//4.4.5.7	获取相册列表接口CG040507
//{
//    “funcId”:” CG040507”,
//    “ uid “:”100003”,
//    “ tm_id “:”4690”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetTeamAlbumList_funcId @"CG040507"


//4.4.5.8	获取相册中照片接口CG040508
//{
//    “funcId”:” CG040508”,
//    “ uid “:”100003”,
//    “ aid “:”12”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetPhotoListFromTeamAlbum_funcId @"CG040508"

//100.4.5.9	获取相册类型CG040509
//{
//    “funcId”:” CG040509”,
//    “ uid “:”100003”,
//    “ tm_id “:”4690”
//}
#define GetTeamAlbumCategoryList_funcId @"CG040509"

//---------------------团队视频接口------------------------

//4.4.6.1	获取视频列表接口CG040601
//{
//    “funcId”:” CG040601”,
//    “ uid “:”100003”,
//    “ tid “:”40”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetTeamVideoList_funcId @"CG040601"


//---------------------讨论区接口---------------------------

//4.4.7.1	发帖接口CG040701
//{
//    “funcId”:” CG040701”,
//    “ uid “:”100003”,
//    “ recommended_self”:”0”,
//    “ pride “:”0”,
//    “ sign “:”0”,
//    “ title “:”信息”,
//    “ field “:”0”,
//    “ tid “:”27679”,
//    “ content “:”信息”
//}
#define DiscussSendBBS_funcId @"CG040701"

//4.4.7.2	获取帖列表接口CG040702
//{
//    “funcId”:” CG040702”,
//    “ uid “:”100003”,
//    “ tid “:”10”,
//    “ fid “:”1”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define DiscussGetBBSList_funcId @"CG040702"


//4.4.7.3	查看帖子详情及帖子回复接口CG040703（参照CG040107）
//{
//    “funcId”:” CG040703”,
//    “ uid “:”100003”,
//    “ id “:”10”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define DiscussGetBBSDetail_ReplyDetail_funcId @"CG040703"

//4.4.7.4	回帖接口CG040704
//{
//    “funcId”:” CG040704”,
//    “ uid “:”100003”,
//    “ recommended_self”:”0”,
//    “ pride “:”0”,
//    “ sign “:”0”,
//    “ title “:”信息”,
//    “ pid “:”信息”,
//    “ content “:”信息”
//}
#define DiscussReplyBBS_funcId @"CG040704"

//4.4.7.5	编辑回帖接口CG040705
//{
//    “funcId”:” CG040705”,
//    “ uid “:”100003”,
//    “ title “:”信息”,
//    “ id “:”112
//    “ content “:”信息”
//}
#define DiscussEditReply_funcId @"CG040705"

//4.4.7.6	删除回帖接口CG040706
//{
//    “funcId”:” CG040706”,
//    “ uid “:”100003”,
//    “ id”:”10”
//}
#define DiscussDeleteReply_funcId @"CG040706"

//4.4.7.7	编辑发帖接口CG040707
//{
//    “funcId”:” CG040707”,
//    “ uid “:”100003”,
//    “ recommended_self”:”0”,
//    “ pride “:”1”,
//    “ sign “:”0”,
//    “ title “:”信息学校”,
//    “ field “:”0”,
//    “ id”:”1791535”,
//    “ tid”:”27679”,
//    “ content “:”信息学校”
//}
#define DiscussEditBBS_funcId @"CG040707"


//4.4.7.8	删除发帖接口CG040708
//{
//    “funcId”:” CG040708”,
//    “uid”:”100003”,
//    “id”:”信息”
//}
#define DiscussDeleteBBS_funcId @"CG040708"


//-------------------约战接口------------------------------

//4.5.1.1	获取约战信息列表接口CG050101
//{
//    "funcId":" CG050101",
//    " type_id ":"",
//    " city_id ":"620100",
//    " area_id ":"1" ,
//    " title ":"兰州米兰同城德比大战",
//    " week ":"",
//    " pageSize":"10",
//    " currentPage":"1"
//}
#define GetFighteInfoList_funcId @"CG050101"


//4.5.1.2	获取约战详情接口CG050102
//{
//    “funcId”:” CG050102”,
//    “ uid “:”100003”,
//    “ p_id “:” 228”
//}
#define GetFighteDetail_funcId @"CG050102"


//4.5.1.3	创建约战CG050103
//{
//    “funcId”:” CG050103”,
//    “ user_id “:”100003”
//    “ type_id “:”100”,
//    “ team_name “:”0”,
//    “ city_id “:”620100”,
//    “ area_id “:”0”,
//    “ area_name “:”城关区”,
//    “ title “:”挑战全世界”,
//    “ play_time “:” 2014-01-01 15:00:00”,
//    “ game_hall “:”待定”,
//    “ qq “:”972293570”
//}
#define CreateFighte_funcId @"CG050103"


//4.5.1.4	立即应战接口CG050104
#define GoToFighting_funcId @"CG050104"


//----------------------场馆接口------------------

//4.6.1.1	获取场馆信息列表接口CG060101
//{
//    “funcId”:” CG060101”,
//    “ sports_type “:””,
//    “ city_id “:”620100”,
//    “ area_id “:”1”,
//    “ title “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetStadiumList_funcId @"CG060101"

//4.6.1.2	获取场馆详情接口CG060102
//{
//    “funcId”:” CG060102”,
//    “ uid “:””,
//    “ gym_id “:” 1746”
//}
#define GetStadiumDetail_funcId @"CG060102"

//发布场馆CG060103（预留）
//{
//    “funcId”:” CG050103”,
//    “ user_id “:”100003”
//    “ type_id “:”100”,
//    “ team_name “:”0”,
//    “ city_id “:”620100”,
//    “ area_id “:”0”,
//    “ area_name “:”城关区”,
//    “ title “:”挑战全世界”,
//    “ play_time “:” 2014-01-01 15:00:00”,
//    “ game_hall “:”待定”,
//    “ qq “:”972293570”
//}
#define PublishStadium_funcId @"CG060103"


//场馆预约接口CG060104（预留）
//{
//    “funcId”:” CG050104”,
//    “user_id”:”493179”,
//    “ pid “:”228”,
//    “ reuser_id “:”508300”,
//    “ team_id “:”2565”,
//    “ replay_name “:”张志鹏”,
//    “ telephone “:”13993172077”,
//    “ email”:”lzafa@126.com”,
//    “ msn”:”13993172077”,
//    “ qq”:””
//}
#define StadiumOrder_funcId @"CG060104"


//-------------------机构接口-------------------

//4.7.1.1	创建机构接口CG070101
//{
//    “funcId”:” CG070101”,
//    “ creater”:”100003”,
//    “ creater_name “:”李四”,
//    “ type “:”101”,
//    “ name “:”机构-2”,
//    “ domain “:”eclipwer2”,
//    “ tel “:”18627565223”,
//    “ city “:”430101”,
//    “ location “:”深圳万科”,
//    “ build_date “:”2013-9-14”,
//    “ kind “:”O”,
//    “ qq “:”972293570”,
//    “ slogan “:”友谊第一，比赛第二”,
//    “ icon”:”/photos/f/aa.img”,
//    “ banner”:”/photos/f/aa.img”,
//    “ content “:”计算机的覅假摔帝附加赛地方”,
//    “ contacter”:”小吴”,
//    “ right “:”0”
//}
#define CreateOrganization_funcId @"CG070101"


//4.7.1.2	获取联盟列表接口CG070102
//{
//    “funcId”:” CG070102”,
//    “ uid “:””,
//    “ kind “:””,
//    “ city “:” “,
//    “ name “:” “,
//    “ order “:”pv_count”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetUnionList_funcId @"CG070102"


#define GetOrgaddDis_funcId @"CG070701"
#define GetOrgDisFid_funcId @"CG070702"
//4.7.1.3	加入团队联盟/加入本机构接口CG070103
//{
//    “funcId”:” CG070103”,
//    “ uid”:”100003”,
//    “ club_id”:”209”,
//    “ team_id “:””,
//    “ truename “:””,
//    “ mobile “:””,
//    “ qq “:””,
//    “ msn “:””
//}
#define JoinTeamUnion_Or_Organization_funcId @"CG070103"


//4.7.1.4	获取团队联盟详情接口CG070104
//{
//    “funcId”:” CG070104”,
//    “ uid “:”100003”,
//    “ club_id “:” 4690”
//}
#define GetTeamUnionDetailInfo_funcId @"CG070104"


//4.7.1.5	获取活动公告列表接口CG070105（显示前5条）
#define GetActivityNoticeList_funcId @"CG070105"


//-------------------赛事中心接口-------------------

//4.7.2.1	获取赛事列表接口CG070201
//{
//    “funcId”:” CG070201”,
//    “ uid “:”100003”,
//    “ c_id “:”308”,
//    “ m_type “:””,
//    “ f_type “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”4690”
//}
#define GetMatchCenter_MatchList_funcId @"CG070201"


//4.7.2.2	获取赛程赛果接口CG070202
#define GetMatchCenter_MatchResultList_funcId @"CG070202"


//4.7.2.3	获取联盟积分榜接口CG070203
#define GetMatchCenter_UnionScoreList_funcId @"CG070203"


//4.7.2.4	获取联盟参赛队伍接口CG070204
#define GetMatchCenter_MatchUnionTeamList_funcId @"CG070204"


//4.7.2.5	获取联盟参数个人数据接口CG070205
#define GetMatchCenter_PersonData_funcId @"CG070205"


//----------------------新闻接口-------------------

//4.7.3.1	获取新闻列表接口CG070301
//{
//    “funcId”:” CG070301”,
//    “ uid “:”100003”,
//    “ club_id “:”255”,
//    “ class_id “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetNewsList_funcId @"CG070301"

//4.7.3.2	获取新闻详情接口CG070302
//{
//    “funcId”:” CG070302”,
//    “ uid “:”100003”,
//    “ club_id “:”100003”,
//    “ id “:” 1082”
//}
#define GetNewsDetailInfo_funcId @"CG070302"


//---------------------团队接口----------------------

//4.7.4.1	获取入住团队列表接口CG070401
//{
//    “funcId”:” CG070401”,
//    “ uid “:”100003”,
//    “ club_id “:”308”,
//    “ class_id “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetHaveComeInTeamList_funcId @"CG070401"


//4.7.4.2	获取入驻成员接口CG070402
//{
//    “funcId”:” CG070402”,
//    “ uid “:”100003”,
//    “ club_id “:”308”
//}
#define GetHaveComeInMemberList_funcId @"CG070402"


//-------------------联盟机构相册接口--------------------

//4.7.5.1	创建机构联盟相册接口CG070501
//{
//    “funcId”:” CG070501”,
//    “uid”:”10011”,
//    “name”:”自拍”,
//    “ club_id “:”4690”
//}
#define CreateOrganizationUnionAlbum_funcId @"CG070501"


//4.7.5.2	编辑相册接口CG070502
//{
//    “funcId”:” CG070502”,
//    “ uid “:”100003”,
//    “ aid “:”12”,
//    “ name “:”密码”,
//    “ face_photo “:”1”
//}
#define EditOrganizationUnionAlbum_funcId @"CG070502"


//4.7.5.3	删除团相册接口CG070503
//{
//    “funcId”:” CG070503”,
//    “ uid “:”100003”,
//    “ aid “:”10”
//}
#define DeleteOrganizationUnionAlbum_funcId @"CG070503"


//4.7.5.4	上传照片接口CG070504
//{
//    “funcId”:” CG070504”,
//    “ uid “:”100003”,
//    “ club_id “:”4690”,
//    “ aid “:”223965”
//    “ name “:” 2007赛季全家福”,
//    “ description “:” 2007赛季全家福”,
//    “ file “:” 1/66/110019/_0125306001206029466.gif “
//}
#define UploadPhotoToOrganizationUnionAlbum_funcId @"CG070504"


//4.7.5.5	编辑照片接口CG070505
//{
//    “funcId”:” CG070505”,
//    “ uid “:”100003”,
//    “ aid “:”100003”,
//    “ name “:”100003”,
//    “ id “:”10”
//}
#define EditPhotoToOrganizationUnionAlbum_funcId @"CG070505"


//4.7.5.6	删除照片接口CG070506
//{
//    “funcId”:” CG070506”,
//    “ uid “:”100003”,
//    “ id “:”10”
//}
#define DeletePhotoToOrganizationUnionAlbum_funcId @"CG070506"


//4.7.5.7	获取相册列表接口CG070507
//{
//    “funcId”:” CG070507”,
//    “ uid “:”100003”,
//    “ club_id “:”4690”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetOrganizationUnionAlbumList_funcId @"CG070507"


//4.7.5.8	获取相册中照片接口CG070508
//{
//    “funcId”:” CG070508”,
//    “ uid “:”100003”,
//    “ aid “:”12”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetPhotoList_FromOrganizationUnionAlbum_funcId @"CG070508"

//获取相册类型CG070509
//{
//    “funcId”:” CG070509”,
//    “ uid “:”100003”,
//    “ club_id “:”4690”
//}
#define GetOrganizationUnionAlbumCategory_funcId @"CG070509"


//------------------组织俱乐部视频接口---------------

//4.7.6.1	获取视频列表接口CG070601
//{
//    “funcId”:” CG070601”,
//    “ club_id “:”308”,
//    “ type_id “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetOrganizationUnionVideoList_funcId @"CG070601"


//------------------组织讨论区接口--------------------

//4.7.7.1	发帖接口CG070701
//{
//    “funcId”:” CG070701”,
//    “ uid “:”100003”,
//    “ title “:”双十一到了，光棍们准备好了吗”,
//    “ fid “:” 3017 “,
//    “ club_id “:” 1546 “,
//    “ content “:”双十一到了，光棍们准备好了吗，我要脱光啦啦啦啦”
//}
#define SendOrganizationBBS_funcId @"CG070701"

//4.7.7.2	获取帖列表接口CG070702
//{
//    “funcId”:” CG070702”,
//    “ uid “:”100003”,
//    “ club_id “:”209”,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetOrganizationBBSList_funcId @"CG070702"


//4.7.7.3	查看帖子详情及帖子回复接口CG070703
#define GetOrganizationBBSDetail_AndReply_funcId @"CG070703"


//4.7.7.4	回帖接口CG070704
//{
//    “funcId”:” CG070704”,
//    “ uid “:”100004”,
//    “ pid “:”3633”,
//    “ title “:”回复：双十一到了，光棍们准备好了吗”,
//    “ content “:”淘宝是啃人的货。不要相信。”
//}
#define ReplyOrganizationBBS_funcId @"CG070704"


//4.7.7.5	编辑回帖接口CG070705
//{
//    “funcId”:” CG070705”,
//    “ uid “:”100003”,
//    “ title “:”编辑回帖1”,
//    “ id “:”3635”
//    “ content “:”编辑回帖1”
//}
#define EditReplyOrganizationBBS_funcId @"CG070705"


//4.7.7.6	删除发帖/回帖接口CG070706
//{
//    “funcId”:” CG070706”,
//    “ uid “:”100003”,
//    “ id”:”3635”
//}
#define DeleteOrganizationBBSORReply_funcId @"CG070706"


//4.7.7.7	编辑发帖接口CG040707
//{
//    “funcId”:” CG070707”,
//    “ uid “:”100003”,
//    “ title “:”双十一到了，光棍们准备好了吗，别积极急急急”,
//    “ fid “:” 3017 “,
//    “ club_id “:” 1546 “,
//    “ top “:” 1 “,
//    “ content “:”双十一到了，光棍们准备好了吗，我要脱光啦啦啦啦，哈啊hifi阿斯顿佛哦”
//}
#define EditOrganizationBBS_funcId @"CG040707"


//--------------------机构约战接口-----------------

//4.7.8.1	获取机构联盟约战列表接口CG070801
//{
//    “funcId”:” CG070801”,
//    “ club_id “:””,
//    “ city_id “:””,
//    “ area_id “:””,
//    “ week “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetOrganizationUnionFighteList_funcId @"CG070801"


//-----------------------招募接口---------------------

//4.7.9.1	发布招募成员/成员挂牌信息接口CG070901
//{
//    “funcId”:” CG070901”,
//    “ ball_type “:”0”,
//    “ dead_line “:”2013-10-31”,
//    “ is_listing “:”0”,
//    “ uid “:” 493179 “,
//    “ team_id “:” 27539 “,
//    “ club_id “:”703”,
//    “ kepper”:”1”,
//    “ back “:”1”,
//    “ middle “:”0”,
//    “ forward “:”0”,
//    “ qq “:”972293570”,
//    “ m_phone “:”13217065522”,
//    “ desc “:”备注备注”
//}
#define PublishRecruitMember_MemberOutPut_funcId @"CG070901"


//4.7.9.2	获取招募成员/成员挂牌列表接口CG070902
//{
//    “funcId”:” CG070902”,
//    “ club_id “:”703”,
//    “ ball_type “:”101”,
//    “is_listing “:”0”,
//    “ uid “:””,
//    “ pageSize “:”10”,
//    “ currentPage “:”1”
//}
#define GetRecruitMemberList_funcId @"CG070902"


//4.7.9.3	获取招募成员/成员挂牌详情接口CG070903
//{
//    “funcId”:” CG070903”,
//    “ id “:” 231”,
//    “ ball_type “:”101”
//}
#define GetRecruitMemberDetail_funcId @"CG070903"


//----------------------资讯接口---------------------

//4.8.1.1	获取资讯列表接口CG080101
//{
//    "funcId":"CG080101",
//    " uid ":"100003",
//    " city_id ":"158",
//    " type ":"0",
//    " fid":"1",
//    " pageSize ":"5",
//    " currentPage ":"1"
//}
#define GetEinformationList_funcId @"CG080101"


//4.8.1.2	查看资讯详情接口CG080102
//{
//    "funcId":" CG080102",
//    " uid ":"100003",
//    " id ":" 4250"
//}
#define FindEinformationDetail_funcId @"CG080102"


//4.8.1.3	获取焦点图片接口CG080103
//{
//    "funcId":"CG080103",
//    " uid ":"100003",
//    " city_id ":"158"
//}
#define GetHotImage_funcId @"CG080103"


//------------------首页接口-------------------------

//获取城市列表接口CG090101
//{
//    “funcId”:”CG090101”,
//    “ uid “:”100003”
//}
#define GetCityList_funcId @"CG090108"


//获取首页（焦点图、今日头条、今日推荐）接口CG090102
//{
//    “funcId”:” CG090102”,
//    “ uid “:”100003”,
//    “ url “:” http://bj.chinago.cn”
//}
#define GetMainPageHotNews_funcId @"CG090102"

#define GetFootNews_funcId @"CG090107"
//获取CCL新闻资讯
#define GetCCLnews_funcId @"CG130001"
//获取CCL新闻详情
#define GetCCLinfor_funcId @"CG130002"
//CCL比赛进程
#define GetCCLmatch_funcId @"CG130003"
//CCL比赛详情
#define GetCCLmatchInfor_funcId @"CG130004"
//CCL射手榜
#define GetCCLscroList_funcId @"CG130005"
//CCL我的城市
#define GetCCLChickAdd_funcId @"CG130006"
//CCL团队
#define GetCCLChickTeam_funcId @"CG130007"
//CCL城市是否有该赛制
#define GetCCLmatchType_funcId @"CG130008"
//CCL RED榜单
#define GetCCLRedType_funcId @"CG130010"
//我的RED值
#define GetMyCCLRedType_funcId @"CG130013"
//CCL 射手榜
#define GetCCLsheSType_funcId @"CG130011"
//CCL 助攻榜
#define GetCCLzhugType_funcId @"CG130012"
//获取详情接口CG090103
//{
//    “funcId”:”CG090103”,
//    “ uid “:”100003”,
//    “ id “:”158”
//}
#define GetMainPageNewsDetail_funcId @"CG090103"


//查看评论接口CG090104
//{
//    “funcId”:”CG090104”,
//    “ uid “:”100003”,
//    “ id “:”8182”,
//    “pageSize”:”10”,
//    “currentPage”:”1”
//}
#define GetMainPageNewsCommentList_funcId @"CG090104"


//发表评论接口CG090105
//{
//    " funcId ": " CG090105",
//    "cid": "2",
//    "content": "好",
//    "cuid": "110",
//    "fid": "44",
//    "id": "1062",
//    "quoteid": "0",
//    "uid": "1",
//    "username": "hockey2008@qq.com",
//    "yz": "true"
//}
#define SendMainPageNewsComment_funcId @"CG090105"


//获取更多资讯接口CG090106
//funcId	1	String	--	功能号	CG090106
//url	0	String		当前城市
//pageSize	0	String		每页显示多少记录	分页用，可可省略，默认为10
//currentPage	0	String		当前页	分页用，可省略 默认为1
#define GetMainPageHotNewsMore_funcId @"CG090106"

//---------------------附注-----------------------


//---------------------抽奖-----------------------

//获取奖项接口CG100101 获得奖品数据
//{
//    “funcId”:” CG100101”,
//    “uid“:” 1673196”
//}
#define GetLotteryInfo_funcId @"CG100101"

//获取抽奖结果接口CG100102 获得抽奖结果
//{
//    “funcId”:” CG100102”,
//    “uid “:” 1673196”
//}
#define GetLotteryResult_funcId @"CG100102"

//增加抽奖机会接口CG100103
//{
//    “funcId”:” CG100103”,
//    “uid “:” 1673196”
//}
#define AddLotteryChance_funcId @"CG100103"

//记录抽奖结果CG100104
//{
//    "funcId":"CG100104",
//    "uid":"1673196",
//    "id":"5",
//    "tel":"123455",
//    "address":"湖南长沙"
//}
#define RecordLottery_funcId @"CG100104"

//查看抽奖机会次数接口CG100105
//{
//    "funcId":"CG100105",
//    "uid":" chenyonglin1029@163.com ",
//    "id":"5",
//    "tel":"123455",
//    "address":"湖南长沙"
//}
#define SeeLotteryCount_funcId @"CG100105"

//判断当前活动是否结束CG100106
//{
//    "funcId":"CG100106"
//}
#define LotteryIsClose_funcId @"CG100106"

//统计个人中奖信息CG100107
//{
//    "funcId":"CG100107",
//    “email”:” jimmy4887@163.com”
//}
#define GetPersonLotteryRecord_funcId @"CG100107"


//-----------举报接口-------------------//
//funcId	功能号	CG000005
//uid       举报人id
//be_uid	被举报人id
//tid	    举报类型	1营销诈骗
//                  2淫秽色情
//                  3地域攻击
//                  9其他理由
//content	举报理由
//举报言论接口CG000005
//{
//    "funcId": "CG000005",
//    "uid": "493179",
//    "be_uid": "493179",
//    "tid": "1",
//    "content": "12323"
//}

//新版i足球首页数据
#define firstfootball_funcId @"CG140011"

//客户端传递参数
//"funcId":"CG140011"
//"type":"new"
//参数说明：
//new是最新帖子
//local是同城帖子   传入local是需要传入“"city_id":"111"”
//choiceness是精选帖子
//friend是好友帖子	传入local是需要传入“"uid":"111"”
//attention是关注帖子 传入attention是需要传入“"uid":"111"”
//"pageSize":"加油中国账号id"
//"currentPage":"123"

//ii足球帖子评论列表
#define Review_funcId @"CG140012"
//i足球帖子点赞列表
#define Praise_funcId @"CG140013"
//点赞
#define zan_funcId @"CG140003"
//判断是否点赞
#define zanbool_funcId @"CG140016"
//发表评论
#define review_funId @"CG140004"
//帖子详情
#define getPostMsg @"CG140025"


//发帖请求
#define GetPostMessage_funcId @"CG140002"
//发帖话题
#define GetpostTopic_funcId @"CG140014"
//发帖对象
#define GetpostGoal_funcId @"CG140015"

//赞 关注 粉丝数
#define Getzan_funcId @"CG140017"
//我的粉丝 我的关注
#define GetMyFuns_FuncId @"CG140018"
//添加关注
#define GetaddFuns_FuncId @"CG140021"
//添加好友
#define GetaddFriend_FuncId @"CG140023"
//取消关注
#define GetNoFuns_FuncId @"CG140024"
//帖子列表
#define GetPostList_FuncId @"CG140011"
//删除帖子
#define DeletedPost_FuncId @"CG140026"
//帖子pic地址拼接
#define IfootballImage_URL @"http://home.chinago.cn/posts/"
#define GetFrendsList_FuncId @"CG140022"
//我的能量值能量图参数
#define GetEnergy_FuncId @"CG130014"



#define AddReport_funcId @"CG000005"

#define Team_memberId @"CG040302"


#endif
