//
//  JSCollectionListCell.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectionListCell.h"

@implementation JSCollectionListCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        CGRect hrect,rect=self.contentView.bounds;
        CGFloat height=rect.size.height-1;
        CGRectDivide(rect, &hrect, &rect, height, CGRectMinYEdge);
        self.lb=[UILabel LabWithFrame:hrect text:@"" textColor:[UIColor blueColor] textAlign:NSTextAlignmentLeft font:KNormalFontSize];
        [self.contentView addSubview:self.lb];
        
        //line
        UIImageView *line=[UIImageView ImageViewImageName:nil frame:rect];
        line.backgroundColor=[UIColor blackColor];
        [self.contentView addSubview:line];
    }
    return self;
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl collectionViewDateArr:(NSArray *)dateArr cellValue:(id)date indexPath:(NSIndexPath *)indexpath{
    
    self.lb.text=date;
    
}
@end
