//
//  SureOrderViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/13.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "SureOrderViewController.h"
#import "SureOrderAddAddressCell.h"
#import "SureOrderAddressCell.h"
#import "SureOrderFeeDetailsCell.h"
#import "SureOrderPayCell.h"
#import "SureOrderPrivilegeCell.h"
#import "PrivilegeCell.h"
#import "AddressController.h"

@interface SureOrderViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    BOOL _privilegeIsShow;
}
@end

@implementation SureOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"确认订单";
    [self createData];
    [self createView];
   
}

- (void)createData
{
    //_returnSelf(self);
}
- (void)createView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT/7*6) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [self createBottomView];
}

- (void)createBottomView
{
    CGFloat bottomHeight = HEIGHT/7;
    CGFloat margin = 10;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT-bottomHeight, WIDTH, bottomHeight)];
    bottomView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:bottomView];
    
    UILabel *privilegeLabel = [[UILabel alloc] initWithFrame:CGRectMake(margin, 0, WIDTH/6, bottomHeight/3)];
    privilegeLabel.text = @"优惠券：";
    privilegeLabel.font = [UIFont systemFontOfSize:13];
    privilegeLabel.textColor = [UIColor whiteColor];
    [bottomView addSubview:privilegeLabel];
    
    UILabel *privilegeMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/6+margin, 0, WIDTH/7, bottomHeight/3)];
    privilegeMoneyLabel.text = @"-3.00";
    privilegeMoneyLabel.font = [UIFont systemFontOfSize:13];
    privilegeMoneyLabel.textColor = [UIColor whiteColor];
    [bottomView addSubview:privilegeMoneyLabel];
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/4, bottomHeight/3*2-2*margin)];
    totalLabel.text = @"总金额";
    totalLabel.font = [UIFont systemFontOfSize:18];
    totalLabel.textColor = [UIColor whiteColor];
    [bottomView addSubview:totalLabel];
    
    UILabel *totalMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4*3, 0, WIDTH/4, bottomHeight/3)];
    totalMoneyLabel.text = @"￥75.00";
    totalMoneyLabel.font = [UIFont systemFontOfSize:18];
    totalMoneyLabel.textColor = [UIColor whiteColor];
    [bottomView addSubview:totalMoneyLabel];
    
    UIButton *payMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payMoneyBtn.backgroundColor = [UIColor cyanColor];
    payMoneyBtn.clipsToBounds = YES;
    payMoneyBtn.layer.cornerRadius = 10;
    payMoneyBtn.frame = CGRectMake(margin, bottomHeight/3 + margin/2, WIDTH-2*margin, bottomHeight/3*2 - 1.5*margin);
    [payMoneyBtn setTitle:@"付款" forState:UIControlStateNormal];
    [payMoneyBtn addTarget:self action:@selector(payMoneyAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:payMoneyBtn];
    
}

#pragma mark -- tableview 代理方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 1)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        //view.backgroundColor = [UIColor redColor];
        UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor yellowColor];
        label.text = @"费用详情";
        [view addSubview:label];
        return view;
    }
    if (section == 3)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor yellowColor];
        label.text = @"请选择支付方式";
        [view addSubview:label];
        return view;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 80;
    }
    else if (indexPath.section == 1)
    {
        return 80;
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0) {
            return 50;
        }
        return 120;
    }
    else if (indexPath.section == 3)
    {
        return 50;
    }
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    else if (section == 1)
    {
        return 50;
    }
    else if (section == 2)
    {
        return 10;
    }
    else if (section == 3)
    {
        return 50;
    }
    return 0.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        return 4;
    }
    if (section == 2) {
        
        if (_privilegeIsShow) {
            return 3;
        }
        return 1;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"SureOrderCellID";
    
    if (indexPath.section == 0) {
        BOOL hasAddress = arc4random()%2;
        if (hasAddress)
        {
            SureOrderAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderAddressCell" owner:self options:nil] firstObject];
            }
            
            [cell setGetAddressVC:^{
                AddressController *addressVC = [[AddressController alloc] init];
                addressVC.nameTf.text = @"美美";
                addressVC.phonenumTf.text = @"15868808xxx";
                addressVC.addressLabel.text = @"315800";
                addressVC.addressLabel.text = @"浙江省宁波市北仑区";
                addressVC.streetLabel.text = @"松花江路xxx";
                addressVC.addressLabel2.text = @"浙江省宁波市北仑区松花江路xxx";
                addressVC.isModify = YES;
                [self.navigationController pushViewController:addressVC animated:YES];
            }];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }
        SureOrderAddAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderAddAddressCell" owner:self options:nil] lastObject];
            
        }
        [cell setGoToAddressVC:^{
            AddressController *addressVC = [[AddressController alloc] init];
            [self.navigationController pushViewController:addressVC animated:YES];
        }];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.section == 1)
    {
        SureOrderFeeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderFeeDetailsCell" owner:self options:nil] lastObject];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.section == 2)
    {
        if (_privilegeIsShow)
        {
            if (indexPath.row == 0)
            {
                SureOrderPrivilegeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
                if (!cell) {
                    cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderPrivilegeCell" owner:self options:nil] lastObject];
                    
                
                    [cell setGetController:^(BOOL isSelected) {
                        _privilegeIsShow = isSelected;
                        [tableView reloadData];
                       
                    }];
                    
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    return cell;
                }
            }
            PrivilegeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"PrivilegeCell" owner:self options:nil] firstObject];
            }
            return cell;
        }
        SureOrderPrivilegeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderPrivilegeCell" owner:self options:nil] lastObject];
            
            [cell setGetController:^(BOOL isSelected) {
                _privilegeIsShow = isSelected;
                //NSLog(@"_privilegeIsShow-->%d",_privilegeIsShow);
                [tableView reloadData];
            }];
           
    
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if(indexPath.section == 3)
    {
        SureOrderPayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"SureOrderPayCell" owner:self options:nil] lastObject];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 1)
    {
        //设置cell不可点击
    }
    else if(indexPath.section == 2)
    {
        
    }
    
}
- (void)payMoneyAction
{
    
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
