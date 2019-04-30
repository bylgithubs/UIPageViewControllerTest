//
//  ViewController.m
//  UIPageViewControllerTest
//
//  Created by Civet on 2019/4/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

#import "ModelViewController.h"
@interface ViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>

//翻页视图控制器对象
@property(nonatomic) UIPageViewController *pageViewControl;
//数据源数组
@property(nonatomic) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _pageViewControl = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:@{UIPageViewControllerOptionSpineLocationKey:@2,UIPageViewControllerOptionInterPageSpacingKey:@10}];
    self.view.backgroundColor = [UIColor greenColor];
    //设置翻页视图尺寸
    _pageViewControl.view.bounds = self.view.bounds;
    //设置数据源与代理
    _pageViewControl.dataSource = self;
    _pageViewControl.delegate = self;
    
    //创建初始界面
    ModelViewController *model = [ModelViewController createWithIndex:1];
    ModelViewController *model2 = [ModelViewController createWithIndex:2];
    //设置初始界面
    [_pageViewControl setViewControllers:@[model,model2] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    //设置是否双面展示
    _pageViewControl.doubleSided = YES;
    _dataArray = [[NSMutableArray alloc]init];
    [_dataArray addObject:model];
    [self.view addSubview:_pageViewControl.view];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    int index = (int)[_dataArray indexOfObject:viewController];
    NSLog(@"index===========%i",index);
    NSLog(@"arrayconut===========%ld",_dataArray.count);
    if (index == 9){
        return nil;
    }else{
        if (_dataArray.count - 1 >= (index+1)){
            return _dataArray[index+1];
        }else{
            NSLog(@"index11111111111===========%i",index);
            ModelViewController *model = [ModelViewController createWithIndex:index + 2];
            [_dataArray addObject:model];
            return model;
        }
    }
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(nonnull UIViewController *)viewController{
    int index = (int)[_dataArray indexOfObject:viewController];
    if(index == 0){
        return nil;
    }else{
        return _dataArray[index - 1];
    }
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController{
    return 10;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController{
    return 0;
}

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation{
    return UIPageViewControllerSpineLocationMid;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
