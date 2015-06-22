//
//  OrderViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/10.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "OrderViewController.h"
#import "WaitPayCell.h"

@interface OrderViewController ()<UITableViewDelegate,UITableViewDataSource>
{

}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation OrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"WaitPayCell";
    WaitPayCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[WaitPayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
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
