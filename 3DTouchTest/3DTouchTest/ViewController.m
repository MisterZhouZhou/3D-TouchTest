//
//  ViewController.m
//  3DTouchTest
//
//  Created by rayootech on 16/3/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "ViewController.h"
#import "My3DTouchViewController.h"
#import "DetailsViewController.h"
#import "TableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>
@property(nonatomic,weak)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource=self;
    tableView.delegate=self;
    [tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
    [self.view addSubview:tableView];
    self.tableView=tableView;
}
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    // 打开详情页触发
    if (viewControllerToCommit){
        [self showViewController:viewControllerToCommit sender:self];
    }
}
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    // 1.我们可以通过触控的location获取 当前点击的是第几个元素(位于collectionview)
    // 2.由于响应3dtouch事件的view是cell的contentView,我们对触控拿到的location要进行一个转换(相对于collectionview(父视图)来说的位置
    // 3.这里通过previewingContext中sourceView获取到触摸的view
    UIView *contentView = previewingContext.sourceView;
    // 看回"2" 中第一句话,我们要拿到这个触控的location位于collectionview中的位置
    CGPoint iLocation = [contentView convertPoint:location toView:self.tableView];
    // 将 获取到的位置 通过collectionview获取indexPath
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:iLocation];
    
    
    DetailsViewController * detailVC = [[DetailsViewController alloc]init];
    detailVC.titleStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return detailVC;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell"];
    
    //设置代理
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        detailCell.delegate = self;
    }
    detailCell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    
    return detailCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController *detailVC = [[DetailsViewController alloc]init];
    detailVC.titleStr = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
