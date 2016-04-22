//
//  DLBasicViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSBasicViewController : UIViewController

@property(nonatomic,assign)BOOL hiddenNav;
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIView *navView;
@property(nonatomic,strong)UILabel *titlelb;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;

@end
