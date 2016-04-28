//
//  JSNinaPagerViewConfig.h
//  JSThridPod
//
//  Created by gcb999 on 16/4/28.
//  Copyright © 2016年 gcb999. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NinaPagerView.h"


@protocol JSNinaPagerViewConfigDelegate <NSObject>

/**< 如果您觉得创建的控制器过多(>5)占用内存过大，可以尝试此代理方法，默认只保留5个最近滑到的控制器，剩下的控制器将被释放，直到您再滑到相应位置才会被重新加载，如果不执行此代理，则默认为不释放。
 If you care the vcs causes huge memory,please try this delegate,default is load recent 5 vcs,others will dealloc.If you scroll to the dealloc page, it will load again.If you don't use the delegate,default is NO **/
- (BOOL)deallocVCsIfUnnecessary;

@end


@interface JSNinaPagerViewConfig : NSObject

@property(nonatomic,strong)NinaPagerView *ninaPagerView;


+(JSNinaPagerViewConfig*)share;

//步骤1：调用NinaPagerView

//必须调用MakeVisableView （框架问题）
-(void)initWithFrame:(CGRect)frame  delegate:(id<JSNinaPagerViewConfigDelegate>)delegate;


@end
