//
//  RootViewController.m
//  xiaolumeimei
//
//  Created by younishijie on 15/6/4.
//  Copyright (c) 2015年 Mona. All rights reserved.
//
//tag从100开始

#import "RootViewController.h"
#import "ViewController.h"
#import "OneViewController.h"
#import "SecondViewController.h"
#import "PeopleViewController.h"
#import "CartViewController.h"
#import "LoginViewController.h"
#import "PersonCenterViewController.h"



@interface RootViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,RootVCPushToOtherVCProtocol>
{
    UIView *_view;
    UIPageViewController *_pageVC;
    NSArray *_pageContentVC;
    NSInteger _pageCurrentIndex;
}

@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;

@property (weak, nonatomic) IBOutlet UIView *contentViewControllers;
@end

@implementation RootViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [CartView viewShow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.navigationController.navigationBar setTranslucent:false];
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, 64+5+40, WIDTH, HEIGHT - 64 - 5 - 40)];
    [self.view addSubview:_view];
    [self prepareData];
    [self createPageViewController];
    [self createBottomView];
}

- (IBAction)rightBarButtonAction:(id)sender
{
    NSString *userName = [[NSUserDefaults standardUserDefaults] stringForKey:UserName];
    if (!userName) {
        LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginVC"];
        [self.navigationController pushViewController:loginVC animated:YES];
        return;
    }
    PersonCenterViewController *personCenterVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"PCVC"];
    [self.navigationController pushViewController:personCenterVC animated:YES];
    
}

- (void)createBottomView
{
    CGRect frame = CGRectMake(15, HEIGHT - 70+5, 50, 50);
    NSString *count = @"1";
    CartView *cartView = [CartView CartViewWithFrame:frame withGoodsCount:count];
    
    RootViewController *weakSelf = self;
    [cartView setGotoCartCarVCBlock:^{
        CartViewController *cartVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"CartVC"];
        [weakSelf.navigationController pushViewController:cartVC animated:YES];
    }];
    
    [cartView setGotoLoginVC:^{
        LoginViewController *loginVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginVC"];
        
        [weakSelf.navigationController pushViewController:loginVC animated:YES];
    }];
    
    
//    CGRect topFrame = CGRectMake(WIDTH-70, HEIGHT - 70, 60, 60);
//    [self.view addSubview:[GoToTopView GoToTopViewWithFrame:topFrame ]];
    [GoToTopView show];
}

- (void)prepareData
{
    _pageCurrentIndex = 0;
}

- (void)createPageViewController
{
    //_pageVC = [self.storyboard instantiateViewControllerWithIdentifier:@""];
    
    _pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:(UIPageViewControllerNavigationOrientationHorizontal) options:nil];
    _pageVC.view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    _pageVC.view.userInteractionEnabled = YES;
    
    _pageVC.dataSource = self;
    _pageVC.delegate = self;
    
    
    
    
    ViewController *todaysVC = [[ViewController alloc] init];
    todaysVC.delegate = self;
    //todaysVC.getCollectionViewDelegate = self;
    todaysVC.isToday = YES;
    
    ViewController *yesterdayVC = [[ViewController alloc] init];
    yesterdayVC.delegate = self;
    //yesterdayVC.getCollectionViewDelegate = self;
    yesterdayVC.isToday = NO;
    
    PeopleViewController *childVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PeopleVC"];
    childVC.headerText = @"还剩02天01时25分13秒";
    
    PeopleViewController *womanVC = [self.storyboard instantiateViewControllerWithIdentifier:@"PeopleVC"];
    womanVC.headerText = @"还剩02天01时25分13秒";
    
    OneViewController *oneVC = [[OneViewController alloc] init];
    oneVC.view.backgroundColor = [UIColor yellowColor];
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.view.backgroundColor = [UIColor purpleColor];
    
    _pageContentVC = @[todaysVC,yesterdayVC,childVC,womanVC];
    
    
    [_pageVC setViewControllers:@[todaysVC] direction:(UIPageViewControllerNavigationDirectionForward) animated:YES completion:nil];
    
    [self addChildViewController:_pageVC];
    [_view addSubview:_pageVC.view];
    [_pageVC didMoveToParentViewController:self];
    
    
}


- (IBAction)clickToChangeTopicAction:(UIButton *)sender
{
    NSInteger index = sender.tag - 101;
    BOOL state = 0;
    [self sliderLabelPositonWithIndex:index withDuration:.35];
    
    if (_pageCurrentIndex < index) {
        
        state = 1;
       
    }
    
    _pageCurrentIndex = index;
    
    [_pageVC setViewControllers:@[[_pageContentVC objectAtIndex:index]] direction:state?UIPageViewControllerNavigationDirectionForward:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    
}

- (void)sliderLabelPositonWithIndex:(NSInteger)index withDuration:(CGFloat)duration
{
    CGFloat width = self.sliderLabel.frame.size.width;
    CGFloat height = self.sliderLabel.frame.size.height;
    CGFloat x = index * (width+2);
    CGFloat y = self.sliderLabel.frame.origin.y;
    
    self.sliderLabel.frame = CGRectMake(2+x, y, width, height);
}

#pragma mark - PageViewController DataSource
-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [_pageContentVC indexOfObject:viewController];
    
    if (currentIndex < _pageContentVC.count -1) {
        _pageCurrentIndex = currentIndex + 1;
        return [_pageContentVC objectAtIndex:_pageCurrentIndex];
    }
    return nil;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger currentIndex = [_pageContentVC indexOfObject:viewController];
   
    if (currentIndex > 0) {
         _pageCurrentIndex = currentIndex - 1;
        return [_pageContentVC objectAtIndex:_pageCurrentIndex];
    }
    
    return nil;
}

#pragma mark --UIPageViewControllerDelegate
//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
//{
//    NSInteger currentIndex  = [_pageContentVC indexOfObject:pendingViewControllers[0]];
//    
//    [self sliderLabelPositonWithIndex:currentIndex withDuration:.35];
//    
//}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSInteger currentIndex  = [_pageContentVC indexOfObject:pageViewController.viewControllers[0]];
    
    if (completed)
    {
        [self sliderLabelPositonWithIndex:currentIndex withDuration:.35];
        
    }else
    {
        if (finished)
        {
            
            [self sliderLabelPositonWithIndex:currentIndex withDuration:.35];
        }
    }
    
}

-(NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

-(NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

#pragma mark -- RootVCPushToOtherVCProtocol
- (void)rootVCPushToOtherVC:(UIViewController *)otherVC
{
    [self.navigationController.navigationBar setTranslucent:false];
    [self.navigationController pushViewController:otherVC animated:YES];
}

#pragma mark -- GetCollectionViewProtocol

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
