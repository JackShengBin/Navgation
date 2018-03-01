## 项目中经常用到的扩展、宏定义和方法

## UIView+Extension
UIView的快捷属性
快捷添加子view
给数组view添加随机色(适用没数据时使用)
绘制圆角icon
获取导航控制器
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
```

## UIButton+Extension
获取验证码
```
//获取验证码
- (void)getCodeWithInterVale:(NSUInteger)interval EndTitle:(NSString *)endTitle;
```

## PrefixHeader
宏定义、iPhone X判断



## MyNavViewController
隐藏二级页面的tabbar
隐藏导航条黑线

## BINBaseViewController
MBProgressHUD
网络请求
动画跳转
```
@property (nonatomic, readwrite, copy) MBProgressHUD *HUD;

- (void)appearHUDWithContent:(NSString *)content;
- (void)hideHUD;
- (void)addTimeIntervalWithManager:(AFHTTPSessionManager *)manager;
- (void)alertOfOverRun;

//网络请求
- (void)get:(NSString *)urlStr andPara:(NSDictionary*) paraDic andHudStr:(NSString *)hudStr succeed:(void(^)(NSURLSessionDataTask *task, id data))success failed:(void(^)(NSURLSessionDataTask *task, NSError* error))fail;
- (void)post:(NSString *)urlStr andPara:(NSDictionary*) paraDic andHudStr:(NSString *)hudStr succeed:(void(^)(NSURLSessionDataTask *task, id data))success failed:(void(^)(NSURLSessionDataTask *task, NSError* error))fail;


//动画跳转
- (void) pushAnimation:(UIViewController *)toVC  duration: (NSTimeInterval) duration;
- (void) popAniationwithDuration: (NSTimeInterval) duration;
```



## UIColor+ColorHex
16进制转颜色
```
+ (UIColor *) colorWithHexString: (NSString *)color;
```

## LTDetailSlectBtn
按钮中存在子label
![DetailSlectBtn](https://github.com/lintongSD/imageSource/blob/master/DetailSlectBtn.png)

## LTDetailStringView
类似DetailSlectBtn,存在TextField
![DetailStringView](https://github.com/lintongSD/imageSource/blob/master/DetailStringView.png)

## MJLAFAppNetAPIClient
网络请求

## SingleDemo
创建单例
