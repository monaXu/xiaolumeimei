//
//  PeopleView.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,copy) NSString *collectionType;
@property (nonatomic,copy) NSString *headerText;


@property (nonatomic,assign) id<VCPushToOtherVCProtocol> peopleViewDelegate;

@end
