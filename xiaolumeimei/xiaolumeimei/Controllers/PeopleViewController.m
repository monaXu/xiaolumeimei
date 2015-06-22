//
//  PeopleViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "PeopleViewController.h"

#import "PeopleView.h"
#import "GoodsModel.h"
#import "GoToTopView.h"

@interface PeopleViewController ()<VCPushToOtherVCProtocol>
{
    NSMutableArray *_dataArray;
}


@end

@implementation PeopleViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //[self.navigationController.navigationBar setTranslucent:false];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setTranslucent:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *firstView = [[UIView alloc] initWithFrame:self.view.bounds];
    //[self.view addSubview:firstView];
    self.view = firstView;
    self.title = @"今日上新";
    
    [self prepareData];
    
    [self createTopView];
    
    [self createCollectionView];
    
}

- (void)createTopView
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 30)];
    [self.view addSubview:topView];
    CGFloat btnWidth = WIDTH/3;
    CGFloat btnHeight = 30;
    
    UIButton *hasGoodsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    hasGoodsBtn.frame = CGRectMake(0, 0, btnWidth, btnHeight);
    hasGoodsBtn.backgroundColor = [UIColor redColor];
    [hasGoodsBtn setTitle:@"显示有货" forState:UIControlStateNormal];
    [hasGoodsBtn addTarget:self action:@selector(hasGoodsAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:hasGoodsBtn];
    
    UIButton *priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    priceBtn.backgroundColor = [UIColor brownColor];
    priceBtn.frame = CGRectMake(btnWidth, 0, btnWidth, btnHeight);
    [priceBtn setTitle:@"价格" forState:UIControlStateNormal];
    [priceBtn addTarget:self action:@selector(priceAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:priceBtn];
    
    UIButton *countBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    countBtn.backgroundColor = [UIColor blueColor];
    countBtn.frame = CGRectMake(2*btnWidth, 0, btnWidth, btnHeight);
    [countBtn setTitle:@"销量" forState:UIControlStateNormal];
    [countBtn addTarget:self action:@selector(countAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:countBtn];
}


- (void)hasGoodsAction
{
    NSLog(@"显示有货按钮被点击~");
}

- (void)priceAction
{
    NSLog(@"价格按钮被点击~");
}

- (void)countAction
{
    NSLog(@"销量按钮被点击~");
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    PeopleView *collectionView = [[PeopleView alloc] initWithFrame:CGRectMake(0, 30, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
    collectionView.peopleViewDelegate = self;
    collectionView.dataArray = _dataArray;
    collectionView.headerText = _headerText;
    collectionView.collectionType = @"People";
    [self.view addSubview:collectionView];
    [NSString stringWithFormat:@"%d",1];
    
    //返回顶部设置
    [GoToTopView goToTopView:collectionView];
}
- (void)prepareData
{
    
    _dataArray = [[NSMutableArray alloc] init];
    
    for (NSInteger raw = 0; raw<9; raw ++) {
        GoodsModel *model = [[GoodsModel alloc] init];
        model.imgUrl = @"img_place";
        model.title = @"纯棉深灰色个性不规则....";
        model.fullPrice = @"￥168";
        model.hasMore = arc4random() %2;
        
        [_dataArray addObject:model];
    }

}



- (void)vcPuthToOtherVC:(UIViewController *)otherVC
{
    [self.navigationController.navigationBar setTranslucent:false];
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
