//
//  GoToTopView.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/11.
//  Copyright (c) 2015年 Mona. All rights reserved.
//

#import "GoToTopView.h"

@interface GoToTopView ()

@end
@implementation GoToTopView
{
    UIButton *_toTopBtn;
    UICollectionView *_collectionView;
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
static  NSMutableArray *_collectionViewArr;

+ (id)shareManage
{
    static GoToTopView *m = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        m = [[GoToTopView alloc] init];
        
    });
    return m;
}
- (id)init
{
    self = [super init];
    
    if (self) {
    
        _collectionViewArr = [[NSMutableArray alloc] init];
        
        CGRect frame = CGRectMake(WIDTH-70, HEIGHT - 70, 60, 60);
        self.frame = frame;
        self.alpha = 0.5;
        self.backgroundColor = [UIColor clearColor];
        CGFloat margin = 5;
        CGFloat height = self.frame.size.height;
        CGFloat width = self.frame.size.width;
        CGFloat btnWidht = width - 2*margin;
        CGFloat btnHeight = height - 2*margin;
        _toTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _toTopBtn.backgroundColor = [UIColor cyanColor];
        _toTopBtn.frame = CGRectMake(margin, margin, btnWidht, btnHeight);
        
        _toTopBtn.layer.masksToBounds = YES;
        _toTopBtn.layer.cornerRadius = btnHeight/2;
        
        
        [_toTopBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [_toTopBtn addTarget:self action:@selector(goToTop) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_toTopBtn];
        
        //_collectionViewArr = [[NSMutableArray alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:self];;
    }
    
    return self;
}

+ (void)goToTopView:(UICollectionView *)collectionView
{
    [[self shareManage]addCollectionView:collectionView];
}

- (void)addCollectionView:(UICollectionView *)collectionView
{
    [_collectionViewArr addObject:collectionView];
}

+ (GoToTopView *)GoToTopViewWithFrame:(CGRect)frame
{
    return [[self shareManage] initWithFrame:frame];
}

- (void)goToTop
{
    NSLog(@"_collectionViewarr %lu",(unsigned long)_collectionViewArr.count);
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
    for (UICollectionView *collectionView in _collectionViewArr) {
        [collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    }
   
    NSLog(@"返回首部按钮被点击~~");
}   

- (void)hidden
{
    self.hidden = YES;
}

- (void)show
{
    self.hidden = NO;
}

+ (void)hidden
{
    [[self shareManage] hidden];
}

+ (void)show
{
    [[self shareManage]show];
}

- (void)firstFrame
{
    CGRect frame = CGRectMake(WIDTH-70, HEIGHT - 70, 60, 60);
    self.frame = frame;
}

- (void)secondFrame
{
    CGRect frame = CGRectMake(WIDTH-70, HEIGHT - 70 - 40, 60, 60);
    self.frame = frame;
}

+ (void)firstFrame
{
    [[self shareManage] firstFrame];
}

+ (void)secondFrame
{
    [[self shareManage] secondFrame];
}

@end
