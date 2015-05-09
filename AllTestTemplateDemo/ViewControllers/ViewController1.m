//
//  ViewController1.m
//  AllTestTemplateDemo
//
//  Created by luo.h on 15-5-8.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//

#import "ViewController1.h"
#import "UIImage+GIF.h"
#import "MBProgressHUD.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self gifPlay6];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
