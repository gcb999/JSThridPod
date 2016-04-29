//
//  JSWaterFlowOutController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSWaterFlowOutController.h"

#import "CollectionViewCell.h"
#import "JSWaterFlowLayout.h"

@interface JSWaterFlowOutController ()<JSWaterFlowLayoutDelegate>

@end


@implementation JSWaterFlowOutController
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"瀑布流水布局用法";
    
    
    
    
    JSWaterFlowLayout *layout = [[JSWaterFlowLayout alloc]init];
    layout.delegate = self;
    

    
    CGRect rect =self.contentView.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[CollectionViewCell class] delegate:self];
    ctrl.view.frame=rect;
    ctrl.flowLayout=layout;
 
    
    [self.contentView addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{

    if (currentPage==1) {
        NSArray *date=@[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"];
        [SWCtrl.data addObjectsFromArray:date];
        [SWCtrl reloadHeader];
    }
    else if (currentPage<3){
        NSArray *date=@[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"];
        [SWCtrl.data addObjectsFromArray:date];
        [SWCtrl reloadFooter];
    }
    else{
        [SWCtrl.data removeAllObjects];//无网状态
        [SWCtrl reloadFooter];
    }
    
   
    
    
}

#pragma mark -  流水布局的方法<CYXWaterFlowLayoutDelegate>

//设置每个Item高度
- (CGFloat)waterflowLayout:(JSWaterFlowLayout *)waterflowLayout heightForItemAtIndex:(NSUInteger)index itemWidth:(CGFloat)itemWidth
{
    return 100 + arc4random_uniform(150);
}

- (CGFloat)rowMarginInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return 10;
}

#pragma mark -设置一行几列
- (CGFloat)columnCountInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return 2;
}
#pragma mark-设置 section
- (UIEdgeInsets)edgeInsetsInWaterflowLayout:(JSWaterFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
