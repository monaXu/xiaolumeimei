//
//  GoodesCollecionView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/5.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "GoodesCollecionView.h"

@implementation GoodesCollecionView



#pragma mark --CollectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellID";
    
    return nil;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView * headView = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(5, 5, 300, 20)];
//    UILabel *label = [[UILabel alloc] initWithFrame:headView.bounds];
//    NSString *title = nil;
//    if (indexPath.section == 0) {
//        title = @"每天10：00";
//    }
//    else if(indexPath.section == 1)
//    {
//        title = @"潮童专区";
//    }
//    else if(indexPath.section == 2)
//    {
//        title = @"时尚女装";
//    }
//    if (kind == UICollectionElementKindSectionHeader) {
//        label.text = title;
//    }
//    
//   
//    return headView;
//}


@end
