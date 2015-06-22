//
//  PeopleView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "PeopleView.h"
#import "GoodsCell.h"
#import "RecipeCollectionHeaderView.h"
#import "StyleViewController.h"
#import "DetailViewController.h"

@implementation PeopleView


-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        //self.backgroundColor = [UIColor orangeColor];
        [self registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellWithReuseIdentifier:@"GoodsCell"];
        [self registerNib:[UINib nibWithNibName:@"RecipeCollectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}


#pragma mark --CollectionView代理方法
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    return _dataArray?_dataArray.count:0;
//}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //NSArray * sectionArr = _dataArray[section];
    return _dataArray?_dataArray.count:0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *goodsCellID = @"GoodsCell";
    GoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:goodsCellID forIndexPath:indexPath];
    [cell fillData:_dataArray[indexPath.row]];
    return cell;
    
}
//
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    RecipeCollectionHeaderView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    if ([_collectionType isEqualToString:@"People"]) {
        
        headView.backgroundColor = [UIColor orangeColor];
        headView.headerLabel.text = _headerText;
        return headView;
    }
    else if([_collectionType isEqualToString:@"Style"])
    {
        headView.headerLabel.hidden = YES;
        UIImageView *adImageView = [[UIImageView alloc] initWithFrame:headView.bounds];
        adImageView.backgroundColor = [UIColor yellowColor];
        [headView addSubview:adImageView];
        return headView;
    }
    return nil;
   
}


#pragma mark - UICollectionViewDelegateFlowLayout
//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(WIDTH/2-15, HEIGHT/3);
}
//定义每个Section 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 7.5, 15, 7.5);//分别为上、左、下、右
    
}

//返回头headerView的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={0,0};
    if ([_collectionType isEqualToString:@"People"]) {
        return CGSizeMake(WIDTH, 40);
    }
    else if ([_collectionType isEqualToString:@"Style"])
    {
        return CGSizeMake(WIDTH, 90);
    }
    return size;
}

//返回头footerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize size={0,0};
    return size;
}

//每个section中不同的行之间的行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor greenColor]];
    
    GoodsModel *model = _dataArray[indexPath.row];
   
    if ([_collectionType isEqualToString:@"People"])
    {
        if (model.hasMore) {
            StyleViewController *styleVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"StyleVC"];
            [self.peopleViewDelegate vcPuthToOtherVC:styleVC];
        }
        else
        {
            DetailViewController *detailVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"DetailVC"];
            [self.peopleViewDelegate vcPuthToOtherVC:detailVC];
        }
        
        
    
    }
    else if ([_collectionType isEqualToString:@"Style"])
    {
        DetailViewController *detailVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"DetailVC"];
        [self.peopleViewDelegate vcPuthToOtherVC:detailVC];
    }
}
//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
}

@end
