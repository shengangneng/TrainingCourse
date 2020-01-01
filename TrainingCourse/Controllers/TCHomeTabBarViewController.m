//
//  TCHomeTabBarViewController.m
//  TrainingCourse
//
//  Created by gangneng shen on 2020/1/1.
//  Copyright © 2020 gangneng shen. All rights reserved.
//

#import "TCHomeTabBarViewController.h"
#import "TCHomeViewController.h"
#import "TCGoodQualityViewController.h"
#import "TCShoppingMallViewController.h"
#import "TCMineViewController.h"
#import "MPMBaseNavigationController.h"

@interface TCHomeTabBarViewController ()

@end

@implementation TCHomeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAttributes];
    [self setupChildVC];
    
}

- (void)setupAttributes {
    // 设置tabBar为不透明（默认模式是半透明的）
    self.tabBar.translucent = NO;
}

- (void)setupChildVC {
    TCHomeViewController *home = [[TCHomeViewController alloc] init];
    [self setChildVC:home title:@"首页" image:@"tab_home_nor" selectedImage:@"tab_home_hig" nav:YES];
    
    TCGoodQualityViewController *quality = [[TCGoodQualityViewController alloc] init];
    [self setChildVC:quality title:@"精品课" image:@"tab_good_nor" selectedImage:@"tab_good_hig" nav:YES];
    
    TCShoppingMallViewController *shopping = [[TCShoppingMallViewController alloc] init];
    [self setChildVC:shopping title:@"商城" image:@"tab_shop_nor" selectedImage:@"tab_shop_hig" nav:YES];
    
    TCMineViewController *mine = [[TCMineViewController alloc] init];
    [self setChildVC:mine title:@"我的" image:@"tab_mine_nor" selectedImage:@"tab_mine_hig" nav:YES];
}

- (void)setChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage nav:(BOOL)nav {
    
    childVC.tabBarItem.title = title;
    // 设置normal模式下tabbar
    NSMutableDictionary *ndict = [NSMutableDictionary dictionary];
    ndict[NSForegroundColorAttributeName] = kTextLightColor;
    ndict[NSFontAttributeName] = SystemFont(12);
    [childVC.tabBarItem setTitleTextAttributes:ndict forState:UIControlStateNormal];
    // 设置select模式下tabbar
    NSMutableDictionary *sdict = [NSMutableDictionary dictionary];
    sdict[NSForegroundColorAttributeName] = kMainBlueColor;
    sdict[NSFontAttributeName] = SystemFont(12);
    [childVC.tabBarItem setTitleTextAttributes:sdict forState:UIControlStateSelected];
    childVC.tabBarItem.image = [ImageName(image) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [childVC.tabBarItem setImageInsets:UIEdgeInsetsMake(-2, 0, 2, 0)];
    [childVC.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    childVC.tabBarItem.selectedImage = [ImageName(selectedImage) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    MPMBaseNavigationController *navVC = [[MPMBaseNavigationController alloc] initWithRootViewController:childVC];
    if (nav) {
        [self addChildViewController:navVC];
    } else {
        [self addChildViewController:childVC];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSInteger index = [self.tabBar.items indexOfObject:item];
    [self animationWithIndex:index];
}

- (void)animationWithIndex:(NSInteger)index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount = 1;
    pulse.autoreverses = YES;
    pulse.fromValue = [NSNumber numberWithFloat:0.8];
    pulse.toValue = [NSNumber numberWithFloat:1.2];
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
}

@end
