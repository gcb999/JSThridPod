//
//  Normal002Controller.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "Normal002Controller.h"

#import "CollectionViewCell.h"
#import "JSLineLayout.h"

@interface Normal002Controller ()<JSCollectionViewControllerDelegate>

@end

@implementation Normal002Controller
-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"LineFlowOut流水布局用法";
    
    

    
    JSLineLayout *layout=[[JSLineLayout alloc] init];
    
    
    CGRect rect =self.contentView.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[CollectionViewCell class] delegate:self];
    ctrl.view.frame=rect;
    ctrl.flowLayout=layout;
    // 隐藏水平滚动条
    ctrl.collectionView.showsHorizontalScrollIndicator = NO;
    
    // 取消弹簧效果
    ctrl.collectionView.bounces = NO;
    
    // 开启分页
    ctrl.collectionView.pagingEnabled = YES;
    
    [self.contentView addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    [SWCtrl.data removeAllObjects];
    NSArray *date=@[@"1",@"2",@"1",@"2",@"1",@"2",@"1",@"2"];
    [SWCtrl.data addObjectsFromArray:date];
    [SWCtrl reloadHeader];
    
    
}
@end
