//
//  IntegralViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/15.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "IntegralViewController.h"

@interface IntegralViewController ()
{
    //UIView *backView;
}
@end

@implementation IntegralViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"我的积分";
    self.view.backgroundColor = [UIColor clearColor];
    
    [self createNoIntegralView];

}

- (void)createNoIntegralView
{
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    CGFloat margin = 20;
    CGFloat width = WIDTH - 2*margin;
    CGFloat height = HEIGHT/12;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(margin, HEIGHT/3, width, height*2)];
    label.text = @"您还未获得积分，赶快去首页购买商品，获得积分吧~";
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:label];
    
    UIButton *gotoRootVCBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gotoRootVCBtn.frame = CGRectMake(margin, HEIGHT/3*2, width, height);
    [gotoRootVCBtn setTitle:@"去首页逛逛" forState:UIControlStateNormal];
    [gotoRootVCBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    gotoRootVCBtn.backgroundColor = [UIColor yellowColor];
    [gotoRootVCBtn addTarget:self action:@selector(gotoRootVCAction) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:gotoRootVCBtn];
}

- (void)createIntegralView
{
    
}

- (void)gotoRootVCAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
