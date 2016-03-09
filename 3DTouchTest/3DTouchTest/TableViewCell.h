//
//  TableViewCell.h
//  3DTouchTest
//
//  Created by rayootech on 16/3/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

// 3dtouch代理
@property (weak,nonatomic) id<UIViewControllerPreviewingDelegate> delegate;
@end
