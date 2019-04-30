//
//  ModelViewController.h
//  UIPageViewControllerTest
//
//  Created by Civet on 2019/4/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModelViewController : UIViewController

//创建自身类对象的类方法
+ (ModelViewController *)createWithIndex:(int)index;

@property(nonatomic,strong)UILabel *indexLabel;

@end
