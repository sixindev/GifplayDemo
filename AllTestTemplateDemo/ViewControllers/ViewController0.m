//
//  ViewController0.m
//  AllTestTemplateDemo
//
//  Created by luo.h on 15-5-8.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//

#import "ViewController0.h"
#import "UIImageView+Animation.h"
#import "YFGIFImageView.h"
#import "SCGIFImageView.h"

#import "YLImageView.h"
#import "YLGIFImage.h"



#import "UIImage+GIF.h"
#import "MBProgressHUD.h"

@interface ViewController0 ()

@end

@implementation ViewController0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"Gif显示播放";
    
    [self gifPlay1];
//    [self gifPlay2];
//    [self gifPlay3];
//    [self gifPlay4];
//    [self gifPlay5];
//      [self gifPlay6];
//      [self gifPlay7];
}





/**
 *   UIImageView 动画
 *   Memory-23M
 */
-(void)gifPlay1
{
//    NSArray  *array=@[@"image0.png",@"image1.png",@"image2.png"];
//    UIImageView  *imgview= [UIImageView imageViewAnimation:CGRectMake(50,80, 550/2, 200)  imageNames:array duration:1];
    
    UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50,150, 550/2, 200)];
    animatedImageView.animationImages =@[[UIImage imageNamed:@"image0"],
                                         [UIImage imageNamed:@"image1"],
                                         [UIImage imageNamed:@"image2"],
                                         ];
    animatedImageView.animationDuration = 1.0f;
    animatedImageView.animationRepeatCount = 0;
    [self.view addSubview: animatedImageView];
    [animatedImageView startAnimating];
}


/**
 *  UIImageView-PlayGIF 是 UIImageView 子类，用来显示 GIF。UIIMageView-PlayGIF 性能高，而且占用的内存很低。
 *  https://github.com/yfme/UIImageView-PlayGIF
 *  Memory-21.9M
 */
-(void)gifPlay2
{
    NSString  *gifPath=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
    YFGIFImageView  *gifview=[[YFGIFImageView alloc]init];
    gifview.backgroundColor=[UIColor clearColor];
    gifview.gifPath=gifPath;
    gifview.frame=CGRectMake(50, 100,550/2, 200);
     [self.view addSubview:gifview];
    [gifview startGIF];
}



/**
 *  摘要: SCGIFImageView是一个开源的GIF图片动画显示控件，通过将GIF的每一帧都取出来生成UIImage对象存放在一个数组中，然后使用NSTimer进行动画轮转。
 *  https://github.com/shichangone/SCGifExample
 *  Memory-22.5M
 */
-(void)gifPlay3
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"test.gif" ofType:nil];
    NSData* imageData = [NSData dataWithContentsOfFile:filePath];
    SCGIFImageView* gifImageView = [[SCGIFImageView alloc]init];
    [gifImageView setData:imageData];
    gifImageView.frame = CGRectMake(50,100, gifImageView.image.size.width, gifImageView.image.size.height);
    [self.view addSubview:gifImageView];
}


/**
 *  YLGIFImage 是异步 GIF 图像解码器和图像查看器，支持播放 GIF 图像，而且使用很少的内存。
 *  https://github.com/liyong03/YLGIFImage
 *  Memory-22.7M
 */
-(void)gifPlay5
{
    YLImageView* imageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 160, 320, 240)];
    [self.view addSubview:imageView];
    imageView.image = [YLGIFImage imageNamed:@"test.gif"];
}


/**
 *  利用SDWebImageView 库播放gif
 *  Memory-22.6M
 */
-(void)gifPlay34
{
    UIImage  *image=[UIImage sd_animatedGIFNamed:@"test"];
    UIImageView  *gifview=[[UIImageView alloc]initWithFrame:CGRectMake(50,80,image.size.width, image.size.height)];
    gifview.backgroundColor=[UIColor orangeColor];
    gifview.image=image;
    [self.view addSubview:gifview];
    
}


/**
 *  MBProgressHUD 添加加载动画
 *  Memory-23.8M
 */
-(void)gifPlay6
{
    UIImage  *image=[UIImage sd_animatedGIFNamed:@"test"];
    UIImageView  *gifview=[[UIImageView alloc]initWithFrame:CGRectMake(0,0,image.size.width/2, image.size.height/2)];
    gifview.image=image;
    
     MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
     hud.color=[UIColor grayColor];//默认颜色太深了
     hud.mode = MBProgressHUDModeCustomView;
     hud.labelText = @"加载中...";
     hud.customView=gifview;
}



/**
 *  Memory-23.8M
 */
-(void)gifPlay7
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"gif"];
    NSData *gifData = [NSData dataWithContentsOfFile:path];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 120, 550/2, 200)];
    webView.backgroundColor = [UIColor redColor];
    webView.scalesPageToFit = YES;
    [webView loadData:gifData MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    [self.view addSubview:webView];
}



//判断图片是否为GIF格式
+ (BOOL)isGifImage:(NSData*)imageData {
    const char* buf = (const char*)[imageData bytes];
    if (buf[0] == 0x47 && buf[1] == 0x49 && buf[2] == 0x46 && buf[3] == 0x38) {
        return YES;
    }
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
