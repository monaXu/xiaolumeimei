//
//  ViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/3.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "ViewController.h"
#import "GoodsLayout.h"
#import "GoodsCell.h"
#import "AdCell.h"
#import "RecipeCollectionHeaderView.h"
#import "PeopleViewController.h"
#import "DetailViewController.h"
#import "TitleCell.h"
#import "PersonCenterHeaderView.h"
#import "HeaderView1.h"
#import "HeaderView2.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *firstView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.view = firstView;
    //[self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    
    [self createData];

    [self createView];
}

- (void)createData
{
    _dataArray = [[NSMutableArray alloc] init];
    for (int seciton=0; seciton<3; seciton ++) {
        
        GoodsModel *model = [[GoodsModel alloc] init];
        
        if (seciton == 0)
        {
            NSMutableArray *rawArr = [[NSMutableArray alloc] init];
            [rawArr addObject:@"每天10：00 新品上线"];
            AdModel *model = [[AdModel alloc] init];
            for (NSInteger raw = 0; raw<2; raw ++)
            {
                model.imageUrl = @"ad_place";
                model.remainDay = @"还剩2天";
                model.hasMore = arc4random()%2;
                [rawArr addObject:model];
            }
            [_dataArray addObject:rawArr];
        }

        else if (seciton == 1)
        {
            NSMutableArray *rawArr2 = [[NSMutableArray alloc] init];
            [rawArr2 addObject:@"潮童专区"];
            for (NSInteger raw = 0; raw<2; raw ++) {
                model.imgUrl = @"img_place";
                model.title = @"纯棉深灰色个性不规则....";
                model.price = @"￥68";
                model.fullPrice = @"￥168";
                model.isSoldOut = arc4random()%2;
                [rawArr2 addObject:model];
            }
            [_dataArray addObject:rawArr2];
        }
        else
        {
            NSMutableArray *rawArr3 = [[NSMutableArray alloc] init];
            [rawArr3 addObject:@"时尚女装"];
            for (NSInteger raw = 0; raw<2; raw ++) {
                model.imgUrl = @"img_place";
                model.title = @"纯棉深灰色个性不规则....";
                model.price = @"￥68";
                model.fullPrice = @"￥168";
                [rawArr3 addObject:model];
            }
            [_dataArray addObject:rawArr3];
        }
        
    }
}

- (void)createView
{
    GoodsLayout *layout = [[GoodsLayout alloc] init];
    //layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 50);
    layout.dataArray = _dataArray;
    layout.isToday = _isToday;
    

    //UICollectionViewFlowLayout
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,0, WIDTH, HEIGHT-64-45) collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    
    _collectionView.backgroundColor = [UIColor whiteColor];

    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    
    
    //在需要的时候，调用这个类，创建cell
    [_collectionView registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellWithReuseIdentifier:@"GoodsCell"];
    [_collectionView registerClass:[HeaderView1 class] forCellWithReuseIdentifier:@"TitleCell1"];
    [_collectionView registerClass:[HeaderView2 class] forCellWithReuseIdentifier:@"TitleCell2"];
    //[_collectionView registerClass:[TitleCell class] forCellWithReuseIdentifier:@"TitleCell"];
   
    [_collectionView registerNib:[UINib nibWithNibName:@"AdCell" bundle:nil] forCellWithReuseIdentifier:@"AdCell"];
    
    //注册返回首部
    [GoToTopView goToTopView:_collectionView];
    
    
    
}
#pragma mark --CollectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataArray?_dataArray.count:0;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray * sectionArr = _dataArray[section];
    return sectionArr?sectionArr.count:0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *addCellID = @"AdCell";
    if (indexPath.section == 0) {
        if(indexPath.row == 0)
        {
            HeaderView1 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleCell1" forIndexPath:indexPath];
            
            //[cell fillTitle:_dataArray[0][0]];

            
            return cell;
            
        }
        AdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:addCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor blackColor];
        [cell fillAddData:_dataArray[indexPath.section][indexPath.row]];
        return cell;
    }
    static NSString *cellIdentifier = @"GoodsCell";
    GoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        HeaderView2 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TitleCell2" forIndexPath:indexPath];
        
        [cell fillWithTitle:_dataArray[1][0]];
        return cell;
    }
    if (indexPath.section == 1) {
        cell.backgroundColor = [UIColor yellowColor];
    }
    else
    {
        cell.backgroundColor = [UIColor greenColor];
    }
    [cell fillData:_dataArray[indexPath.section][indexPath.row]];
    return cell;
    
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    RecipeCollectionHeaderView *headerView;
    if (kind == UICollectionElementKindSectionHeader)
    {
         headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    }

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:headerView.bounds];
    [headerView addSubview:titleLabel];
    NSString *title = nil;
    if (indexPath.section == 0) {
        title = @"每天10：00";
    }
    else if(indexPath.section == 1)
    {
        title = @"潮童专区";
    }
    else if(indexPath.section == 2)
    {
        title = @"时尚女装";
    }
    if (kind == UICollectionElementKindSectionHeader) {
        
        //headerView.titleLabel.text = title;
        titleLabel.text = title;
        //label.text = title;
    }
    
    reusableview = headerView;
    return reusableview;
}


#pragma mark - UICollectionViewDelegateFlowLayout

//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor greenColor]];
    
    UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
        }
        //AdModel *model = _dataArray[indexPath.section][indexPath.row];
        PeopleViewController *aaVC = [mainStory instantiateViewControllerWithIdentifier:@"PeopleVC"];
        aaVC.headerText = @"aaaaaaaa";
        
        [self.delegate rootVCPushToOtherVC:aaVC];
      
    }
    else
    {
        PeopleViewController *aaVC = [mainStory instantiateViewControllerWithIdentifier:@"PeopleVC"];
        aaVC.headerText = @"";
        
        [self.delegate rootVCPushToOtherVC:aaVC];
    }
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor redColor]];
}


- (void)tapAction
{
    NSLog(@"tap----------------->");
}


@end
