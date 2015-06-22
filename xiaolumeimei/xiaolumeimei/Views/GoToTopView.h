//
//  GoToTopView.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/11.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoToTopView : UIView

+ (GoToTopView *)GoToTopViewWithFrame:(CGRect)frame;

+ (void)goToTopView:(UICollectionView *)collectionView;


+ (void)hidden;

+ (void)show;

+ (void)firstFrame;

+ (void)secondFrame;

@end
