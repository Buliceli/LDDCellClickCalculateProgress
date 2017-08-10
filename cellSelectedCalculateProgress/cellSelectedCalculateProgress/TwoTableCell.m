//
//  TwoTableCell.m
//  testCopods
//
//  Created by 李洞洞 on 10/8/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TwoTableCell.h"

@interface TwoTableCell ()

@end
@implementation TwoTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
     _progressView.transform = CGAffineTransformMakeScale(1.0f, 2.0f);
     
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    _progressLabel.backgroundColor = [UIColor cyanColor];
}

@end
