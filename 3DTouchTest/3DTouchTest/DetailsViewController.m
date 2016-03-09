//
//  DetailsViewController.m
//  3DTouchTest
//
//  Created by rayootech on 16/3/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100,30)];
    label.center = self.view.center;
    label.textColor=[UIColor whiteColor];
    label.text = [NSString stringWithFormat:@"内容为：%@d",_titleStr];
    [self.view addSubview:label];
    
}

#pragma mark 代理方法,设置 这个页面可以选择的按钮(3dtouch 呼出预览页后处于下方的按钮)
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *itemA = [UIPreviewAction actionWithTitle:@"加入购物车" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"加入购物车");
    }];
    UIPreviewAction *itemA2 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"取消");
    }];
    return @[itemA,itemA2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
