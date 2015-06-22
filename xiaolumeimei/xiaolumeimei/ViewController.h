//
//  ViewController.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/3.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^getCollectionView)(UICollectionView *collectionView);

@interface ViewController : UIViewController


@property (nonatomic,assign) id<RootVCPushToOtherVCProtocol> delegate;
//@property (nonatomic,assign) id<GetCollectionViewProtocol> getCollectionViewDelegate;

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,assign) BOOL isToday;

@end

