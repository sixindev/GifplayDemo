//
//  ViewController.m
//  AllTestTemplateDemo
//
//  Created by luo.h on 15-5-8.
//  Copyright (c) 2015年 sibu.cn. All rights reserved.
//

#import "ViewController.h"
#import "GlobalMacro.h"

#import "ViewController0.h"
#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)  UITableView  *myTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"测试";
    [self createTableView];
}

#pragma mark----CreatMyCustomTablevIew-----
- (void)createTableView
{
    self.myTableView = [[UITableView  alloc] initWithFrame:CGRectMake(0,0,kScreen_Width, kScreen_Height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"REUSE_CELLID"];
    self.myTableView.contentSize=CGSizeMake(kScreen_Width,kScreen_Height*2);
    [self.view  addSubview:self.myTableView];
}


#pragma mark--- UITableViewDataSource and UITableViewDelegate Methods---
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"REUSE_CELLID"];
    cell.textLabel.text=[NSString stringWithFormat:@"测试%ld",(long)indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}


#pragma mark----tableView--@optional 方法-----
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择行数--%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
        {
            ViewController0 *vc=[[ViewController0  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        
        }
            break;
        case 1:
        {
            ViewController1 *vc=[[ViewController1  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            ViewController2 *vc=[[ViewController2  alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
