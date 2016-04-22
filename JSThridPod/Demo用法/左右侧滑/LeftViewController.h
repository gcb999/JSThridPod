//
//  LeftViewController.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@class RightViewController;


@interface LeftViewController : JSBasicViewController

@property(nonatomic,strong)JASidePanelController *jaSidePanelCtrl;

@property(nonatomic,strong) RightViewController *rightCtrl;

@end
