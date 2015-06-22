//
//  StyleViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/10.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "StyleViewController.h"
#import "PeopleView.h"
#import "GoodsModel.h"

@interface StyleViewController ()<VCPushToOtherVCProtocol>
{
    NSMutableArray *_dataArray;
}
@end

@implementation StyleViewController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:true];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareData];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    PeopleView *collectionView = [[PeopleView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
    collectionView.peopleViewDelegate = self;
    collectionView.dataArray = _dataArray;
    
    collectionView.collectionType = @"Style";
    [self.view addSubview:collectionView];
    [NSString stringWithFormat:@"%d",1];
}

- (void)prepareData
{
    
    _dataArray = [[NSMutableArray alloc] init];
    
    for (NSInteger raw = 0; raw<9; raw ++) {
        GoodsModel *model = [[GoodsModel alloc] init];
        model.imgUrl = @"img_place";
        model.title = @"纯棉深灰色个性不规则....";
        model.price = @"￥68";
        model.fullPrice = @"￥168";
        
        [_dataArray addObject:model];
    }
    
}

- (void)vcPuthToOtherVC:(UIViewController *)otherVC
{
    [self.navigationController pushViewController:otherVC animated:YES];
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
