//
//  TableViewCell.m
//  3DTouchTest
//
//  Created by rayootech on 16/3/7.
//  Copyright © 2016年 rayootech. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setDelegate:(id<UIViewControllerPreviewingDelegate>)delegate{
    // 这里设置代理,需要控制好设置(registerForPreviewingWithDelegate)的次数,确保每个cell都有register就可以,但不要重复(若大量registerForPreviewingWithDelegate 会造成滑动失控)
    if (!_delegate){
        _delegate = delegate;
        UIViewController *controller = (UIViewController *)delegate;
        [controller registerForPreviewingWithDelegate:delegate sourceView:self.contentView];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
