//
//  CartViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/8.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "CartViewController.h"
#import "CartTableViewCell.h"
#import "CartCarTableViewCell.h"
#import "SureOrderViewController.h"

@interface CartViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation CartViewController
{
    UILabel *_moneyLabel;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CartView viewHidden];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [CartView viewShow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"购物车";
    
    [self createData];
    
    [self createView];
}

- (void)createData
{
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++)
    {
        [_dataArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

- (void)createView
{
    CGFloat tableViewHeight = HEIGHT/14*12;
    CGFloat bottomViewHeight = HEIGHT - tableViewHeight;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, WIDTH, tableViewHeight-64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectZero];
    _tableView.tableFooterView = footerView;
    
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, tableViewHeight, WIDTH, bottomViewHeight)];
    //bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];
    
    CGFloat margin = 10;
    CGFloat firstHeight = bottomViewHeight/3;
    CGFloat secondHeight = bottomViewHeight - firstHeight;

    UILabel *totalMoneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, 0, WIDTH/4, firstHeight)];
    totalMoneyLabel.text = @"总金额";
    [bottomView addSubview:totalMoneyLabel];
    
    _moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/4*3, 0, WIDTH/4, firstHeight)];
    _moneyLabel.text = @"￥204.00";
    [bottomView addSubview:_moneyLabel];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(margin, firstHeight+margin/2, WIDTH - 2*margin, secondHeight-2*margin);
    [sureBtn setTitle:@"购买" forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    sureBtn.backgroundColor = [UIColor cyanColor];
    sureBtn.clipsToBounds = YES;
    sureBtn.layer.cornerRadius = 5;
    [bottomView addSubview:sureBtn];
}

- (void)sureAction
{
    SureOrderViewController *sureOrderVC = [[SureOrderViewController alloc] init];
    [self.navigationController pushViewController:sureOrderVC animated:YES];
    NSLog(@"购买按钮被点击~~");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"CartCell";
    CartCarTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
       // cell = [[CartCarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell = [[NSBundle mainBundle] loadNibNamed:@"CartCarTableViewCell" owner:self options:nil].lastObject;
    }
    [cell setCartDeleteBlock:^{
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        //[_tableView reloadData];
        
    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
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
