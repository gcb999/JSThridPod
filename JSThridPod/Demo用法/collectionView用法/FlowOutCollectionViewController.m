//
//  FlowOutCollectionViewController.m
//  JSThridKit
//
//  Created by gcb999 on 16/3/29.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "FlowOutCollectionViewController.h"
#import "CollectionViewCell.h"

@interface FlowOutCollectionViewController ()<JSCollectionViewControllerDelegate>

@end

@implementation FlowOutCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"home";
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    
    
    CGRect rect =self.view.bounds;
    
    JSCollectionViewController *ctrl=[[JSCollectionViewController alloc] initWithState:JSCollectionViewPullHeaderFooter CollectionViewCellClass:[CollectionViewCell class] delegate:self];
    ctrl.view.frame=rect;
    [self.view addSubview:ctrl.view];
    [self addChildViewController:ctrl];
    
//    JSBaseFlowLayout *flowlayOunt=[[JSBaseFlowLayout alloc] initWithScrollDirection:UICollectionViewScrollDirectionVertical itemSize:CGSizeMake(IPHONScreenWidth*0.5f-30, 100)];
    
//    ctrl.flowLayout=flowlayOunt;
}

//JSCollectionViewController:LoadRequestCurrentPage:
-(void)JSCollectionViewController:(JSCollectionViewController *)JSCtrl LoadRequestCurrentPage:(NSInteger)currentPage{
    
    
    if (currentPage==1) {
        NSArray *date=@[
                        @"001",
                        @"002"
                        
                        ];
        [JSCtrl.data addObjectsFromArray:date];
        
        [JSCtrl reloadHeader];
    }
    else if (currentPage==2) {
        NSArray *date=@[
                        @"001",
                        @"002"
                        
                        ];
        [JSCtrl.data addObjectsFromArray:date];
        [JSCtrl reloadFooter];
    }
    else{
        [JSCtrl.data removeAllObjects];
        [JSCtrl reloadFooter];
    }
    
    
    
    
    
    
}

-(void)JSTableViewController:(JSTableViewController *)SWCtrl didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
