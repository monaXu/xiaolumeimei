//
//  AddressController.h
//  Younishijie
//
//  Created by younishijie on 15/3/19.
//  Copyright (c) 2015年 younishijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CacheManager.h"

@interface AddressController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
{
    UITableView *_tableView;
}
/*
 UITextField *_nameTf;
 UITextField *_phonenumTf;
 UITextField *_postcodeTf;
 UITextView *_detailView;
 UILabel *_streetLabel;
 UILabel *_addressLabel;
 UILabel *_addressLabel2;
 */

@property (nonatomic,strong) UITextField *nameTf;
@property (nonatomic,strong) UITextField *phonenumTf;
@property (nonatomic,strong) UITextField *postcodeTf;
@property (nonatomic,strong) UITextView *detailView;
@property (nonatomic,strong) UILabel *streetLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *addressLabel2;
@property (nonatomic,assign) BOOL isModify;

@end
