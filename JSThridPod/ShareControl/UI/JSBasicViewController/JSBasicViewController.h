//
//  DLBasicViewController.h
//  CommonBaseContrloller
//
//  Created by gcb999 on 15/12/16.
//  Copyright © 2015年 gcb999. All rights reserved.
//

#import <UIKit/UIKit.h>






@interface JSBasicViewController : UIViewController<UIViewControllerPreviewingDelegate>

@property(nonatomic,assign)BOOL hiddenNav;
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,strong)UIView *navView;
@property(nonatomic,strong)UILabel *titlelb;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UIButton *rightBtn;

#pragma mark -注册3DTouch 功能
-(void)register3DTouchWithSourceView:(UIView *)sourceView  peekViewCtrCls:(Class)peekCls;

@property(nonatomic,strong)Class peekCls;

#pragma mark -Peek 手势
//Peek
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location;

#pragma mark -POP 手势
-(void) popViewController:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit;


- (void)loadTitleView;

#pragma mark ---左侧按钮
- (void)addBackBtn;
@end
