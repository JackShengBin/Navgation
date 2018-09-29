//
//  LTWebViewController.m
//  BaoShouApp
//
//  Created by ZhiFan on 2018/9/25.
//  Copyright © 2018年 SmartSail. All rights reserved.
//

#import "LTWebViewController.h"
#import <WebKit/WebKit.h>
@interface LTWebViewController () <WKNavigationDelegate,WKUIDelegate, WKScriptMessageHandler>

@property (nonatomic, strong) WKWebView *webView;
@property (weak, nonatomic) CALayer *progresslayer;
@property (strong, nonatomic) WKWebViewConfiguration *configuration;

@end

@implementation LTWebViewController

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"页面开始加载时调用");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    NSLog(@"当内容开始返回时调用");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"页面加载完成之后调用");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(nonnull NSError *)error{
    //    ShowErrorStatus(error);
    ShowMessage(@"页面加载失败");
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"页面加载失败时调用");
}


// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    //如果是跳转一个新页面
    
    decisionHandler(WKNavigationResponsePolicyAllow);
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    if ([navigationAction.request.URL.absoluteString containsString:@"/end.html"]){
        //如果没有需要拼接字符串redirect_url=URLEncode
        for (UIViewController *vc in self.navigationController.childViewControllers) {
            if ([vc isKindOfClass:NSClassFromString(@"SSProductDetailVC")]) {
                [self.navigationController popToViewController:vc animated:YES];
                break;
            }
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    }else{
        decisionHandler(WKNavigationActionPolicyAllow);
        NSLog(@"%@",navigationAction.request.URL.absoluteString);
    }
}
//****************JS与OC交互*****************
//配置
- (WKWebViewConfiguration *)configuration{
    if (!_configuration) {
        _configuration = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        _configuration.userContentController = userContentController;
    }
    return _configuration;
}

#pragma mark----ScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //JS调用OC方法
    NSLog(@"body:%@",message.body);
}

#pragma mark----UI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self clearCache2];
    [self clearCache3];
    [self.view addSubview:self.webView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    
    //进度条
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 2)];
    progress.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 2);
    layer.backgroundColor = [UIColor lt_colorWithHexString:@"0x6686A7"].CGColor;
    [progress.layer addSublayer:layer];
    self.progresslayer = layer;
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self loadURLRequest];
//    [self setupBarItem];
}

- (void) setupBarItem{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"icon_arrow_left"] forState:0];
    leftButton.frame = CGRectMake(0, 0, 25, 25);
    leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [leftButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:@"ic_dynamic_video_close"] forState:0];
    closeBtn.frame = CGRectMake(0, 0, 25, 25);
    closeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    UIBarButtonItem *popItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItems = @[popItem];
}

- (void)closeAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) loadURLRequest{
#pragma mark --- 1. 设置Request缓存策略
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr] cachePolicy:(NSURLRequestReloadIgnoringLocalCacheData) timeoutInterval:10.f];
    [self.webView loadRequest:request];//[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}
#pragma mark - 观察者
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progresslayer.opacity = 1;
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[NSKeyValueChangeNewKey] floatValue], 2);
//        @weakify(self)
        if ([change[NSKeyValueChangeNewKey] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                @strongify(self)
                self.progresslayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                @strongify(self)
                self.progresslayer.frame = CGRectMake(0, 0, 0, 2);
            });
        }
    } else if ([keyPath isEqualToString:@"title"]) {
        self.navigationItem.title = change[NSKeyValueChangeNewKey];
    } else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-navBarHeight) configuration:self.configuration];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        _webView.configuration.allowsInlineMediaPlayback = YES;
    }
    return _webView;
}

#pragma mark ---- 2. 清除URLCache(不能清除静态资源)
- (void)clearCache2{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [[NSURLCache sharedURLCache] setDiskCapacity:0];
    [[NSURLCache sharedURLCache] setMemoryCapacity:0];
}

#pragma mark ---- 3. 通过设置WebsiteDataTypes
- (void)clearCache3{
    // 清除部分，可以自己设置
    // NSSet *websiteDataTypes= [NSSet setWithArray:types];
    // 清除所有
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    NSDate *dateFrom = [NSDate dateWithTimeIntervalSince1970:0];
    [[WKWebsiteDataStore defaultDataStore] removeDataOfTypes:websiteDataTypes modifiedSince:dateFrom completionHandler:^{
        // Done
        NSLog(@"清楚缓存完毕");
    }];
}

@end
