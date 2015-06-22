//
//  ModifyPasswordController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/18.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "ModifyPasswordController.h"
#import "LoadingView.h"

@interface ModifyPasswordController ()
{
    
    __weak IBOutlet UITextField *phoneNumTf;
    __weak IBOutlet UITextField *vertifyCodeTf;
    __weak IBOutlet UITextField *passwordTf;
    __weak IBOutlet UITextField *surePasswordTf;
    __weak IBOutlet UIButton *vertifyBtn;
    NSTimer *countDownTimer;
    int secondsCountDown;
}
@end

@implementation ModifyPasswordController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"注册";
    secondsCountDown = 60;
    
    
    
   
}

- (IBAction)getVertifyCodeAction:(id)sender
{
    [LoadingView startAnimating];
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    vertifyBtn.userInteractionEnabled = NO;
    [vertifyBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [vertifyBtn setTitle:[NSString stringWithFormat:@"获取验证码 %d",secondsCountDown] forState:UIControlStateNormal];

}

- (IBAction)sureAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)timeFireMethod
{
    secondsCountDown--;
    [vertifyBtn setTitle:[NSString stringWithFormat:@"获取验证码 %d",secondsCountDown] forState:UIControlStateNormal];
    
    if (secondsCountDown == 55) {
        secondsCountDown=60;
        [countDownTimer invalidate];
        vertifyBtn.userInteractionEnabled = YES;
        [vertifyBtn setTitle:[NSString stringWithFormat:@"获取验证码"] forState:UIControlStateNormal];
         [vertifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [LoadingView stopAnimating];
    }
    
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
