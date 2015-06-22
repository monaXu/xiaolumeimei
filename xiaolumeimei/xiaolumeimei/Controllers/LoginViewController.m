//
//  LoginViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/19.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "LoginViewController.h"
#import "ModifyPasswordController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTf;

@property (weak, nonatomic) IBOutlet UITextField *passwordTf;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
}

- (IBAction)loginAction:(id)sender
{
    NSString *userName = _userNameTf.text;
    userName = @"Mona";
    [[NSUserDefaults standardUserDefaults] setObject:userName forKey:UserName];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)registerAction:(id)sender
{
    ModifyPasswordController *modifyVC = [[ModifyPasswordController alloc] init];
    [self presentViewController:modifyVC animated:NO completion:nil];
    [self.navigationController pushViewController:modifyVC animated:NO];
}

- (IBAction)weixinLoginAction:(id)sender
{
    
    [self sendAuthRequest];
    
}


- (void)sendAuthRequest
{
    
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
