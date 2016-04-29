//
//  Normal001Controller.m
//  JSThridPod
//
//  Created by gcb999 on 16/4/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "Normal001Controller.h"
#import "CollectionViewCell.h"
#import "JSBaseFlowLayout.h"

@interface Normal001Controller ()<JSCollectionViewControllerDelegate>
{
    BOOL flag;
}
@end

@implementation Normal001Controller



-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"BaseFlowOut流水布局用法";
    
    JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:120];
    
 
    
    
  
    
    CGRect rect =self.contentView.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewNormal CollectionViewCellClass:[CollectionViewCell class] delegate:self];
    ctrl.view.frame=rect;
    ctrl.flowLayout=flowout;
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

#pragma mark -点击切换布局
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (flag) {
          JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithDirectionVertical:2 itemHeight:120];
        JSCtrl.flowLayout=flowout;
        
    }
    else{
   
        JSBaseFlowLayout *flowout=[[JSBaseFlowLayout alloc] initWithCollectionView:JSCtrl.collectionView DirectionHorizontal:CGSizeMake(150, 150) minimumLineSpacing:100];
        
        JSCtrl.flowLayout=flowout;
    }
    flag=!flag;
}

@end
