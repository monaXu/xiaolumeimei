//
//  PrivilegeViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/10.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "PrivilegeViewController.h"
#import "PrivilegeCell.h"

@interface PrivilegeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}
@end

@implementation PrivilegeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"优惠券";
    [self prepareData];
    
    [self uiConfig];
}

- (void)prepareData
{
    _dataArray = [[NSMutableArray alloc] init];
}

- (void)uiConfig
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"privileCellID";
    PrivilegeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"PrivilegeCell" owner:self options:nil].lastObject;
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
