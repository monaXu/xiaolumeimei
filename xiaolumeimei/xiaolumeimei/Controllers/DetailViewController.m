//
//  DetailViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "DetailViewController.h"
#import "AddCartView.h"
#import "BuyView.h"


@interface DetailViewController ()
{
    CGRect frame;
}
@end

@implementation DetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setTranslucent:false];
    
    [CartView secondFrame];
    [GoToTopView secondFrame];
    
    [BuyView buyViewShow];
    [AddCartView show];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:true];
   
    [CartView firstFrame];
    [GoToTopView firstFrame];
    
    [BuyView buyViewHidden];
    [AddCartView hidden];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
