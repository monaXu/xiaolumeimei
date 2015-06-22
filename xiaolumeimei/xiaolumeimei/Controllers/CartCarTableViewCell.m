//
//  CartCarTableViewCell.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/12.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "CartCarTableViewCell.h"

@interface CartCarTableViewCell ()
{
    NSUInteger _count;
}
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UITextField *countTf;

@end

@implementation CartCarTableViewCell

- (void)awakeFromNib {
    // Initialization code
    //_deleteBtn.backgroundColor = [UIColor yellowColor];
    CGFloat radius = _deleteBtn.frame.size.height/2;
    _deleteBtn.clipsToBounds = YES;
    _deleteBtn.layer.cornerRadius = radius;
    
    _count = _countTf.text.intValue;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _deleteBtn.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

- (IBAction)deleteAction:(id)sender
{
    NSLog(@"删除按钮被点击~");
    _cartDeleteBlock();
}
- (IBAction)reduceCountAction:(id)sender
{
    if (_count >0) {
        _count--;
        _countTf.text = [@(_count)stringValue];
    }
    
}
- (IBAction)increaseCountAction:(id)sender
{
    _count++;
    _countTf.text = [@(_count)stringValue];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_countTf resignFirstResponder];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

@end
