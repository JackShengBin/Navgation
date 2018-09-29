
### PrefixHeader
```
#define kAppdelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define UserDefault_Safe [[NSUserDefaults standardUserDefaults] synchronize]

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
//view最大y
#define ViewMaxY(View) CGRectGetMaxY(View.frame)
#define ViewMaxX(View) CGRectGetMaxX(View.frame)

//系统view状态
#define is_iPhoneX  (StatusBarHeight>20)
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavHeight(VC) VC.navigationController.navigationBar.frame.size.height
#define BottomHeight(VC) VC.tabBarController.tabBar.frame.size.height
#define BottomAreaHeight (StatusBarHeight>20?34:0)
#define TopHeight(VC) (StatusBarHeight + NavHeight(VC))     //整个导航栏高度

```
### Tools
#### LTHudTool
```
// tosat提示
+ (void) lt_makeTostInView:(UIView *)view position:(ToastPosition)position text:(NSString *)text duration:(CGFloat)duration;
+ (void) lt_makeTostInView:(UIView *)view text:(NSString *)text;

extern void ShowHUD(void);
extern void ShowSuccessStatus(NSString *statues);
extern void ShowErrorStatus(NSError *error);
extern void ShowMaskStatus(NSString *statues);
extern void ShowMessage(NSString *statues);
extern void ShowProgress(CGFloat progress);
extern void DismissHud(void);
```
#### UIButton+Extension
```
//获取验证码
- (void)getCodeWithInterVale:(NSUInteger)interval EndTitle:(NSString *)endTitle;
```
#### UIColor +ColorHex
```
#define themeColor [UIColor lt_colorWithHexString:@"#006BFF"]
#define defaultBgColor [UIColor lt_defaultBgColor]
@interface UIColor (ColorHex)
+ (UIColor *)lt_colorWithHexString: (NSString *)color;
+ (UIColor *)randomColor;

+ (UIColor *)lineColor;
+ (UIColor *)lt_defaultBgColor;
+ (UIColor *)lt_themeColor;

+ (UIColor *)lt_secodTextColor;
```
#### UIView+Extension
```
@property (nonatomic, assign) CGFloat lt_h;

@property (nonatomic, assign) CGFloat lt_w;

@property (nonatomic, assign) CGFloat lt_x;

@property (nonatomic, assign) CGFloat lt_y;

@property (nonatomic, assign) CGSize lt_size;

@property (nonatomic, assign) CGRect lt_frame;

@property (nonatomic, assign) CGPoint lt_origin;


- (void)lt_addSubviews:(NSArray <UIView *>*)subviews;
- (void)lt_backgroundViewkColor:(NSArray<UIView *> *)subviews;

- (UINavigationController *)getSuperViewController;
/**
绘制圆形icon
*/
- (UIImage *)createCornerRadiusWithImage:(UIImage *)image;

/**
设置圆角
*/
- (void)lt_cornerRadius:(CGFloat)radius;
/**
设置边框及颜色
*/
- (void)lt_borderWidth:(CGFloat)width color:(UIColor *)color;
/**
绘制圆形icon
*/
- (UIImage *)createCornerRadiusWithImage:(UIImage *)image;

//设置部分圆角
- (void)addRoundedCorners:(UIRectCorner)corners
withRadii:(CGSize)radii
viewRect:(CGRect)rect;

- (void)addRoundedCorners:(UIRectCorner)corners
withRadii:(CGSize)radii;
/**
移除所有子控件
*/
- (void)lt_removeAllSubViews;
```
#### NetTool
##### LTNetworkManager
```
//成功
typedef void(^SuccessBlock)(id resultData);
//失败
typedef void(^FailureBlock)(NSError *error);
//下载进度
typedef void(^DownloadProgressBlock)(CGFloat progress);
//上传进度
typedef void(^UploadProgressBlock)(CGFloat progress);


//**  网络是否可用 */
@property (nonatomic, assign) BOOL isNetUsable;
//**  网络实际状态 */
@property (nonatomic, assign) AFNetworkReachabilityStatus netStatus;


+ (instancetype)shareManager;

+ (void)httpRequest:(NetRequestType)type
url:(NSString *)url
para:(NSDictionary *)para
success:(SuccessBlock)success
failure:(FailureBlock)failure;
/**
*  下载文件
*
*  @param path     url路径
*  @param success  下载成功
*  @param failure  下载失败
*  @param progress 下载进度
*/

+ (void)downloadWithPath:(NSString *)path
success:(SuccessBlock)success
failure:(FailureBlock)failure
progress:(DownloadProgressBlock)progress;
/**
*  上传图片
*
*  @param path     url地址
*  @param images    UIImage对象
*  @param imagekey    imagekey
*  @param params  上传参数
*  @param success  上传成功
*  @param failure  上传失败
*  @param progress 上传进度
*/

+ (void)uploadImageWithPath:(NSString *)path
params:(NSDictionary *)params
thumbName:(NSString *)imagekey
images:(NSArray *)images
success:(SuccessBlock)success
failure:(FailureBlock)failure
progress:(UploadProgressBlock)progress;

/**
获取网络状态是否可用
@param returnStatus 回调网络是否可用
*/
- (void) checkNetworkStatus:(void(^)(BOOL netUsable))returnStatus;
/**
获取实际的网络状态
@param resultBack 回调实际的网络状态
*/
- (void) getNetorkStatus:(void(^)(AFNetworkReachabilityStatus status))resultBack;

/**
结束网络监听
*/
- (void)stopChetNet;

```
### View
#### LTDetailSlectBtn
按钮中存在子label

![DetailSlectBtn](https://github.com/lintongSD/imageSource/blob/master/DetailSlectBtn.png)

#### LTDirectionBtn
设置按钮中图片和label位置

#### LTDetailStringView
类似DetailSlectBtn,存在TextField

![DetailStringView](https://github.com/lintongSD/imageSource/blob/master/DetailStringView.png)

### Controller
#### LTWebController
简单的WebController
#### BINBaseViewController
```
//自定义转场动画
- (void) pushAnimation:(UIViewController *)toVC  duration: (NSTimeInterval) duration;
- (void) popAniationwithDuration: (NSTimeInterval) duration;
```

#### MyNavViewController
```
隐藏二级页面的tabbar
隐藏导航条黑线
```

