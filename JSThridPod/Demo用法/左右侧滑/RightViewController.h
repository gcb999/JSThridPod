//
//  RightViewController.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/19.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import "JSBasicViewController.h"

@class LeftViewController;

@interface RightViewController : JSBasicViewController

@property(nonatomic,strong)JASidePanelController *jaSidePanelCtrl;

@property(nonatomic,strong) LeftViewController *leftCtrl;
@end
