//
//  JSCollectioinController.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSCollectioinController.h"
#import "JSCollectionListCell.h"
#import "Normal001Controller.h"
#import "Normal002Controller.h"
#import "JSWaterFlowOutController.h"

@interface JSCollectioinController ()<JSCollectionViewControllerDelegate>

@end

@implementation JSCollectioinController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"Collection的常用用法";
    
    CGRect rect =self.contentView.bounds;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    // 定义大小
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);//[UIScreen mainScreen].bounds.size;
    // 设置垂直间距
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.sectionInset=UIEdgeInsetsMake(0, 0, 0, 0);
    // 设置滚动方向（默认垂直水平）
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
   
    
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[JSCollectionListCell class] delegate:self ];
    ctrl.view.frame=rect;
    ctrl.flowLayout=layout;
    [self.contentView addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
}

#pragma mark -实现网络请求数据

-(void)JSCollectionViewController:(JSCollectionViewController *)SWCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
       [SWCtrl.data removeAllObjects];
        NSArray *date=@[@"BaseFlowOut流水布局用法",@"LineFlowOut流水布局用法",@"瀑布流水布局用法",@"Collection 商品图片滚动相处"];
        [SWCtrl.data addObjectsFromArray:date];
        [SWCtrl reloadHeader];
}

-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row=indexPath.row;
    if (row==0) {
        Normal001Controller *ctr=[[Normal001Controller alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if (row==1){
        Normal002Controller *ctr=[[Normal002Controller alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if (row==2){
        JSWaterFlowOutController *ctr=[[JSWaterFlowOutController alloc] init];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if (row==3){
        
    }
}
@end
