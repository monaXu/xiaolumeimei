//
//  GoodsLayout.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/5.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "GoodsLayout.h"

#define MARGIN 10
#define GOODSHEIGHT HEIGHT/3
#define GOODSWIDTH (WIDTH - 3*MARGIN)/2
#define TITLEHEIGHT 30
#define ADSHEIGHT 90

@implementation GoodsLayout
{
    NSArray *_adsArr;
    NSArray *_childArr;
    NSArray *_womenArr;
    
    CGFloat _totalAdsHeight;
    CGFloat _totalChildHeight;
    CGFloat _totalWomenHeight;
}
//返回collectionView的内容大小
- (CGSize)collectionViewContentSize
{
    /**
     * 高度由3部分组成
     */

    if(_isToday)
    {
        _totalAdsHeight = 40;
    }
    else
    {
        _totalAdsHeight = 0;
    }
    
    _totalChildHeight = 40;
    _totalWomenHeight = 40;
    
    /**
     *  第1部分 广告部分
     */
    _adsArr = _dataArray[0];
    if (_adsArr && _adsArr.count > 0)
    {
        NSUInteger count = _adsArr.count-1;
        _totalAdsHeight  += count * (ADSHEIGHT + MARGIN);
    }
    
    /**
     *  第2部分 潮童专区
     */
    _childArr = _dataArray[1];
    if (_childArr && _childArr.count > 0)
    {
        NSUInteger childArrCount = _childArr.count -1;
        NSUInteger count = ((childArrCount%2)?childArrCount + 1:childArrCount)/2;
        _totalChildHeight += count * (GOODSHEIGHT + MARGIN);
    }

    
    /**
     *  第3部分 时尚女装
     */
    
    _womenArr = _dataArray[2];
    if (_womenArr && _womenArr.count > 0)
    {
        NSUInteger womenArrCount = _womenArr.count - 1;
        NSUInteger count = ((womenArrCount%2)?womenArrCount + 1:womenArrCount)/2.0;
        _totalWomenHeight += count * (GOODSHEIGHT + MARGIN);
    }

    
    return  CGSizeMake(0, _totalWomenHeight + _totalChildHeight +_totalAdsHeight);
}

//返回某一个cell对应的属性
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];

    CGFloat adCellHeight = 0;
    
    
    if (indexPath.section == 0) {
        for (int row = 0; row < indexPath.row; row++) {
            
            if (row == 0 ) {
                if (_isToday) {
                    
                    adCellHeight += 40;
                    attr.center = CGPointMake(WIDTH/2, adCellHeight/2);
                    attr.size = CGSizeMake(WIDTH, 30);
                }
                
            }
            else
            {
                adCellHeight += ADSHEIGHT + MARGIN;
            }
            
        }
        
        attr.center = CGPointMake(WIDTH/2, adCellHeight + ADSHEIGHT/2);
        attr.size = CGSizeMake(WIDTH, ADSHEIGHT);
    
        //NSLog(@"%f",attr.frame.origin.y);
        return attr;
    }
    else
    {
        //NSLog(@"AdsHeight %f",_totalAdsHeight);
        CGFloat leftHeight = _totalAdsHeight;
        CGFloat rightHeight = _totalAdsHeight;
        if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                attr.center = CGPointMake(WIDTH/2, leftHeight + 40/2);
                attr.size = CGSizeMake(WIDTH, 30);
                return attr;
            }
            leftHeight += 40;
            rightHeight += 40;

        }
        
        if (indexPath.section == 2) {
            leftHeight = _totalAdsHeight + _totalChildHeight;
            rightHeight = _totalAdsHeight + _totalChildHeight;
            if(indexPath.row ==0)
            {
//                leftHeight += 40;
//                rightHeight += 40;
                attr.center = CGPointMake(WIDTH/2, leftHeight+40/2);
                attr.size = CGSizeMake(WIDTH, 30);
                return attr;
            }
            leftHeight += 40;
            rightHeight += 40;
        }
        
        for (int row = 1; row < indexPath.row; row ++)
        {
            
            if (leftHeight <= rightHeight) {
                //左边
                leftHeight += (GOODSHEIGHT + MARGIN);
            }
            else
            {
                //右边
                rightHeight += (GOODSHEIGHT + MARGIN);
            }
        }
        
        if (leftHeight == rightHeight) {
            attr.center = CGPointMake(MARGIN + GOODSWIDTH/2, leftHeight + GOODSHEIGHT/2);
        }
        else
        {
            attr.center = CGPointMake(2*MARGIN + GOODSWIDTH/2*3, rightHeight +GOODSHEIGHT/2);
        }
        
        attr.size = CGSizeMake(GOODSWIDTH, GOODSHEIGHT);
        return attr;
        
    }
   
#if 0
    else
    {
        if (indexPath.section == 2)
        {
            leftHeight = _totalAdsHeight + _totalChildHeight+50;
            rightHeight = _totalAdsHeight + _totalChildHeight+50;
        }
        for (int row = 0; row < indexPath.row; row ++)
        {
            if (row == 0) {
                
            }
            if (leftHeight <= rightHeight) {
                //左边
                leftHeight += (GOODSHEIGHT + MARGIN);
            }
            else
            {
                //右边
                rightHeight += (GOODSHEIGHT + MARGIN);
            }
        }
        
        if (leftHeight == rightHeight) {
            attr.center = CGPointMake(MARGIN + GOODSWIDTH/2, leftHeight + GOODSHEIGHT/2);
        }
        else
        {
            attr.center = CGPointMake(2*MARGIN + GOODSWIDTH/2*3, rightHeight +GOODSHEIGHT/2);
        }
        
        attr.size = CGSizeMake(GOODSWIDTH, GOODSHEIGHT);
        return attr;
        
    }
    
#endif
    //return attr;
}

//返回包含所有的cell的属性的数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] init];
    for (int section = 0; section < [self.collectionView numberOfSections]; section ++) {
        for (int item = 0; item < [self.collectionView numberOfItemsInSection:section]; item++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
            [layoutAttributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        }
    }
   
    return layoutAttributes;
}



@end
