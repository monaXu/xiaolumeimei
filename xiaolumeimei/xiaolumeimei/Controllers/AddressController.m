//
//  AddressController.m
//  Younishijie
//
//  Created by younishijie on 15/3/19.
//  Copyright (c) 2015年 younishijie. All rights reserved.
//

#import "AddressController.h"

#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
@interface AddressController ()
{
//    UITextField *_nameTf;
//    UITextField *_phonenumTf;
//    UITextField *_postcodeTf;
//    UITextView *_detailView;
//    UILabel *_streetLabel;
//    UILabel *_addressLabel;
//    UILabel *_addressLabel2;
    
    UIPickerView *_pickerView;
    
    NSMutableDictionary *_cityDic;
    NSMutableDictionary *_areaDic;
    NSMutableArray *_provinceArr;
    
    NSInteger _provinceIndex;
    NSInteger _cityIndex;
    NSInteger _areaIndex;
    
    UIToolbar *_toolBar;
    
    
    BOOL _isEdit;
    UIBarButtonItem *_rightBarItem;

}
@end

@implementation AddressController

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:GoToOrder object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地址";
    
    self.view.userInteractionEnabled = NO;
    
    [self prepareData];
    
    [self createRightItem];
    
    [self createTableview];
    
    [self uiConfig];
    
}

- (void)parasingWithData:(id)object
{
    
    NSMutableArray *content = [[NSMutableArray alloc] init];
    
    if ([object isKindOfClass:[NSData class]]) {
        NSError *error = nil;
        content = [NSJSONSerialization JSONObjectWithData:object options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"error= %@",error);
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        [content addObjectsFromArray:object];
    }
    
    for (NSDictionary *provinceDic in content) {
        
        NSString *provinceName = provinceDic[@"name"];
        [_provinceArr addObject:provinceName];
        
        //cityArr存储市的全部信息
        NSArray *cityArr = provinceDic[@"childs"];
        NSMutableArray *cityNameArr = [[NSMutableArray alloc] init];
        for (NSDictionary *cityDic in cityArr)
        {
            
            NSString *cityName = cityDic[@"name"];
            [cityNameArr addObject:cityName];
            
            
            //areaArr存储区的全部信息
            NSMutableArray *areaArr = cityDic[@"childs"];
            NSMutableArray *areaNameArr = [[NSMutableArray alloc] init];
            
            for (NSDictionary *areaDic in areaArr)
            {
                [areaNameArr addObject:areaDic[@"name"]];
            }
            
            [_areaDic setObject:areaNameArr forKey:cityName];
        }
        
        [_cityDic setObject:cityNameArr forKey:provinceName];
    }
    
//    for (NSString *provinceName in _provinceArr) {
//        NSLog(@"\n\n%@",provinceName);
//        NSArray *cityArr = [_cityDic objectForKey:provinceName];
//        for (NSString *cityName in cityArr) {
//            NSLog(@"--%@",cityName);
//            NSArray *areaArr = [_areaDic objectForKey:cityName];
//            for (NSString *areaName in areaArr) {
//                NSLog(@"**%@",areaName);
//                
//            }
//        }
//    }
}

- (void)prepareData
{
    
    _cityDic = [[NSMutableDictionary alloc] init];
    _areaDic = [[NSMutableDictionary alloc] init];
    
    _provinceArr = [[NSMutableArray alloc] init];
   
    
    _provinceIndex = 0;
    _cityIndex = 0;
    _areaIndex = 0;
    
    _isEdit = NO;
    
    
    if ([CacheManager isExist:@"CityDatr"]) {
        [self parasingWithData:[CacheManager getCache:@"CityData"]];
        
        
        
        [self createPickerView];
        
        [self createToolBar];
    }
    else
    {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"31" forKey:@"Event"];
        
        
        [[HttpRequestManager shareInstance] addPOSTRequestParameters:dic success:^(id successobject) {
            
            NSError *error = nil;
            
            
            
            if (!error) {
                //NSLog(@"connet_net:%@",successobject[@"Info"][@"DistrictJsonString"]);
                
                
                [CacheManager saveCache:successobject[@"Info"][@"DistrictJsonString"] forName:@"CityData"];
                [self parasingWithData:successobject[@"Info"][@"DistrictJsonString"]];
                
                
                
                
                
                [self createPickerView];
                
                [self createToolBar];
            }
            else
            {
                NSLog(@"error_net:%@",error);
            }
        } fail:^(id failobject) {
            NSLog(@"%@",failobject);
        }];
    }
    
    
}

#define ToolBarHeight 40
- (void)createToolBar
{
    
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, _pickerView.frame.origin.y-ToolBarHeight, ScreenWidth, ToolBarHeight)];
    [self.view addSubview:_toolBar];
    UIBarButtonItem *lefttem=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction)];
    
    UIBarButtonItem *centerSpace=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *right=[[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(sureAction)];
    _toolBar.items=@[lefttem,centerSpace,right];
}

-(void)cancelAction
{
    [UIView beginAnimations:nil context:nil];
    
    _pickerView.frame = CGRectMake(0, ScreenHeight+ToolBarHeight, ScreenWidth, _pickerView.frame.size.height);
    
    _toolBar.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ToolBarHeight);
    [UIView commitAnimations];
}

- (void)sureAction
{
    [UIView beginAnimations:nil context:nil];
    _pickerView.frame = CGRectMake(0, ScreenHeight+ToolBarHeight, ScreenWidth, _pickerView.frame.size.height);
    
    _toolBar.frame = CGRectMake(0, ScreenHeight, ScreenWidth, ToolBarHeight);
    [UIView commitAnimations];

}

- (void)createPickerView
{
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, ScreenHeight+ToolBarHeight, ScreenWidth, ScreenHeight/3)];
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    [_pickerView reloadAllComponents];
    [self.view addSubview:_pickerView];
    _pickerView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.5];
    _pickerView.showsSelectionIndicator = YES;
}

- (void)createRightItem
{
    _rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"修改地址" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightBarItem;
}

- (void)rightAction
{
    _isEdit = !_isEdit;
    if (_isEdit) {
        self.view.userInteractionEnabled = YES;
        _rightBarItem.title = @"保存";
        
        
    }
    else
    {
        self.view.userInteractionEnabled = NO;
        _rightBarItem.title = @"修改地址";
        
        //调用保存的接口看是否保存成功
        BOOL success = 0;
        if (success) {
            [SVProgressHUD showSuccessWithStatus:@"保存成功"];
        }
        else
        {
            [SVProgressHUD showErrorWithStatus:@"保存失败"];
        }
    }
}

//- (void)saveAction
//{
//    //调用保存的接口看是否保存成功
//    BOOL success = 0;
//    if (success) {
//        [SVProgressHUD showSuccessWithStatus:@"保存成功"];
//    }
//    else
//    {
//        [SVProgressHUD showErrorWithStatus:@"保存失败"];
//    }
//}

- (void)createTableview
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)uiConfig
{
    _nameTf = [[UITextField alloc] init];
    _phonenumTf = [[UITextField alloc] init];
    _postcodeTf = [[UITextField alloc] init];
    _detailView = [[UITextView alloc] init];
    _streetLabel = [[UILabel alloc] init];
    _addressLabel = [[UILabel alloc] init];
    _addressLabel2 = [[UILabel alloc] init];
    _addressLabel2.textColor = [UIColor colorWithWhite:0 alpha:0.5];
    _addressLabel2.font = [UIFont systemFontOfSize:14];
    
    _nameTf.delegate = self;
    _phonenumTf.delegate = self;
    _postcodeTf.delegate = self;
    _detailView.delegate = self;
    
    _nameTf.placeholder = @"收货人姓名";
    _phonenumTf.placeholder = @"手机号码";
    _postcodeTf.placeholder = @"邮政编码";
    _addressLabel.text = @"省、市、区 ";
    _streetLabel.text = @"街道";
    
    _detailView.text = @"详细地址";
    _detailView.textColor = [UIColor colorWithWhite:0.1 alpha:0.5];
    
}
#pragma mark --tableView代理方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 5?100:50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    CGFloat margin = ScreenWidth/20;
    CGRect frame = CGRectMake(margin, cell.frame.origin.y, cell.frame.size.width-2*margin, cell.frame.size.height);
    if(indexPath.row == 0)
    {
        _nameTf.frame = frame;
        [cell.contentView addSubview:_nameTf];
    }
    else if(indexPath.row == 1)
    {
        _phonenumTf.frame = frame;
        [cell.contentView addSubview:_phonenumTf];
    }
    if(indexPath.row == 2)
    {
        _postcodeTf.frame = frame;
        [cell.contentView addSubview:_postcodeTf];
    }
    if(indexPath.row == 3)
    {
        _addressLabel.frame = frame;
        //_addressLabel.backgroundColor = [UIColor redColor];
        _addressLabel2.frame = CGRectMake(frame.size.width/7.0*3, frame.origin.y, ScreenWidth/7.0*4, frame.size.height);
        //_addressLabel2.backgroundColor = [UIColor yellowColor];
        [cell.contentView addSubview:_addressLabel];
        [cell.contentView addSubview:_addressLabel2];
    }
    if(indexPath.row == 4)
    {
        _streetLabel.frame = frame;
        [cell.contentView addSubview:_streetLabel];
    }
    if(indexPath.row == 5)
    {
        _detailView.frame = frame;
        [cell.contentView addSubview:_detailView];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (!(indexPath.row == 0 ||indexPath.row == 1 || indexPath.row == 2||indexPath.row == 5)   ) {
        [_nameTf resignFirstResponder];
        [_phonenumTf resignFirstResponder];
        [_postcodeTf resignFirstResponder];
        [_detailView resignFirstResponder];
    }
    
    if (indexPath.row == 3) {
        [UIView beginAnimations:nil context:nil];
        
        _pickerView.frame =CGRectMake(0, ScreenHeight/3*2+10, ScreenWidth, ScreenHeight/3);
         _toolBar.frame = CGRectMake(0, _pickerView.frame.origin.y-ToolBarHeight, ScreenWidth, ToolBarHeight);
        
        [UIView commitAnimations] ;
    }
    else
    {
        _pickerView.frame =CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight/3);
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_nameTf resignFirstResponder];
    [_phonenumTf resignFirstResponder];
    [_postcodeTf resignFirstResponder];
    [_detailView resignFirstResponder];
    
}
#pragma mark --textfield协议
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nameTf resignFirstResponder];
    [_phonenumTf resignFirstResponder];
    [_postcodeTf resignFirstResponder];
    [_detailView resignFirstResponder];
    return YES;
}

#pragma mark --textView代理方法
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self moveView:-80];
    textView.text = @"";
    _detailView.textColor = [UIColor colorWithWhite:0 alpha:1];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [self moveView:80];
    if (textView.text.length == 0) {
        textView.text = @"详细地址";
        _detailView.textColor = [UIColor colorWithWhite:0.1 alpha:0.5];
    }
}

//view整体移动
- (void)moveView:(CGFloat)move
{
    CGRect frame = self.view.frame;
    frame.origin.y += move;
    self.view.frame = frame;
    [UIView beginAnimations:nil context:nil];
    self.view.frame = frame;
    [UIView commitAnimations];
    
}

#pragma mark -- pickerView代理方法
//返回显示的列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
//返回当前列显示的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _provinceArr?_provinceArr.count:0;
    }
    else if (component == 1) {
        
        if (_provinceArr&&_provinceArr.count>0) {
            NSArray *arr = [_cityDic objectForKey:_provinceArr[_provinceIndex]];
            return arr.count?arr.count:0;
        }
        return 0;
    }
    else if (component == 2) {
        
        if (_provinceArr&&_provinceArr.count>0) {
            NSArray *arr = [_cityDic objectForKey:_provinceArr[_provinceIndex]];
            if (arr&&arr.count>0) {
                NSArray *areaArr = [_areaDic objectForKey:arr[_cityIndex]];
                return areaArr.count?areaArr.count:0;
            }
            else
            {
                return 0;
            }
        }
       
        return 0;
    }
    return 0;
}

//设置当前行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        
        NSString *provinceName = _provinceArr[row];
        
        return provinceName;
    }
    else if (component == 1) {
        NSArray *arr = [_cityDic objectForKey:_provinceArr[_provinceIndex]];
        NSString *cityName = arr[row];
        
        return cityName;
    }
    else if (component == 2) {
        NSArray *arr = [_cityDic objectForKey:_provinceArr[_provinceIndex]];
        
        NSArray *areaArr = [_areaDic objectForKey:arr[_cityIndex]];
        NSString *areaName = areaArr[row];
        
        return areaName;
    }
    
    return nil;
}

//选择的行数
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        _provinceIndex = row;
        _cityIndex = 0;
        _areaIndex = 0;
        [_pickerView reloadComponent:1];
        [_pickerView reloadComponent:2];
    }
    else if (component == 1) {
        _cityIndex = row;
        _areaIndex = 0;
        [_pickerView reloadComponent:2];
    }
    else if (component == 2) {
        _areaIndex = row;
    }
    
    
    NSInteger row1 = [pickerView selectedRowInComponent:0];
    NSInteger row2 = [pickerView selectedRowInComponent:1];
    NSInteger row3 = [pickerView selectedRowInComponent:2];
    NSMutableString *str = [[NSMutableString alloc] init];
    if (_provinceArr && _provinceArr.count>0 && row1<_provinceArr.count) {
        [str appendString:_provinceArr[row1]];
        NSArray *cityArr = _cityDic[_provinceArr[row1]];
        if (cityArr && cityArr.count>0 && row2 < cityArr.count) {
            NSString *cityName = cityArr[row2];
            [str appendString:cityName];
            NSArray *areaArr = _areaDic[cityName];
            if (areaArr && areaArr.count>0 && row3<areaArr.count) {
                [str appendString:areaArr[row3]];
            }
        }
    }
    
    _addressLabel2.text = str;
    
}


//每行显示的文字样式

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 107, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.backgroundColor = [UIColor clearColor];
  

    titleLabel.text = [self pickerView:pickerView titleForRow:row forComponent:component];
    return titleLabel;
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
