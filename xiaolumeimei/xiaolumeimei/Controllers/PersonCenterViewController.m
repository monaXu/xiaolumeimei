//
//  PersonCenterViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/10.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "PersonCenterHeaderView.h"
#import "PrivilegeViewController.h"
#import "SuggestionViewController.h"
#import "IntegralViewController.h"
#import "AddressController.h"
#import "PhoneView.h"
#import "ModifyPasswordController.h"

@interface PersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    PhoneView *_phoneView;
}
@end

@implementation PersonCenterViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    __weak IBOutlet PersonCenterHeaderView *tableHeaderView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CartView viewHidden];
    //[self.navigationController.navigationBar setTranslucent:true];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //[self.navigationController.navigationBar setTranslucent:false];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"个人中心";
    [self createData];
    
    [self uiConfig];
}

- (void)createData
{
    _dataArray = [[NSMutableArray alloc] init];
    NSArray *arr = @[@"优惠券",@"我的积分",@"地址管理",@"退换货申请      201-110111011",@"密码修改",@"投诉建议",@"切换账号",@"退出"];
    [_dataArray addObjectsFromArray:arr];
}

- (void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    

    _tableView.tableHeaderView = tableHeaderView;
    
    
    _phoneView = [[PhoneView alloc] init];
    [self.view addSubview:_phoneView];
    
}
#pragma mark --UItableView datasource 代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray?_dataArray.count:0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

#pragma mark --UITableview delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0)
    {
        PrivilegeViewController *privilegeVC = [[PrivilegeViewController alloc] init];
        [self.navigationController pushViewController:privilegeVC animated:YES];
    }
    if (indexPath.row == 1)
    {
        IntegralViewController *integralVC = [[IntegralViewController alloc] init];
        [self.navigationController pushViewController:integralVC animated:YES];
    }
    if (indexPath.row == 2)
    {
        AddressController *addressVC = [[AddressController alloc] init];
        [self.navigationController pushViewController:addressVC animated:YES];
    }
    if (indexPath.row == 3)
    {
        CGFloat margin = 5;
        CGFloat btnHeight = HEIGHT/15;
        CGFloat btnWidth = WIDTH - 2*(4*margin);
        CGFloat height = margin *2 + 2*btnHeight;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.5];
        _phoneView.frame = CGRectMake(margin * 4, HEIGHT-height, btnWidth, height);
        [UIView commitAnimations];
        
    }
    if (indexPath.row == 4)
    {
        ModifyPasswordController *modifyPasswordVC = [[ModifyPasswordController alloc] init];
        [self.navigationController pushViewController:modifyPasswordVC animated:YES];
    }
    if (indexPath.row == 5)
    {
        SuggestionViewController *suggestionVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SuggestionVC"];
        [self.navigationController pushViewController:suggestionVC animated:YES];
    }
    if (indexPath.row == 6)
    {
        
    }
    if (indexPath.row == 7)
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:UserName];
        [SVProgressHUD showSuccessWithStatus:@"退出登录成功"];
    }
    if (indexPath.row == 8)
    {
        
    }
}


- (IBAction)waitToPayAction:(id)sender
{
    NSLog(@"待支付按钮被点击");
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
