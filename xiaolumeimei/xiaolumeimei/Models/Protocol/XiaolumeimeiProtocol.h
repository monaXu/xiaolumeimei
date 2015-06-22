//
//  XiaolumeimeiProtocol.h
//  xiaolumeimei
//
//  Created by younishijie on 15/6/9.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#ifndef xiaolumeimei_XiaolumeimeiProtocol_h
#define xiaolumeimei_XiaolumeimeiProtocol_h


@protocol RootVCPushToOtherVCProtocol <NSObject>

- (void)rootVCPushToOtherVC:(UIViewController *)otherVC;


@end

@protocol  VCPushToOtherVCProtocol <NSObject>

- (void)vcPuthToOtherVC:(UIViewController *)otherVC;

@end

@protocol GetCollectionViewProtocol <NSObject>

- (void)getCollectionView:(UICollectionView *)collectionView;

@end
#endif
