//
// Created by 安達 彰典 on 2013/07/19.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SWChatViewSide) {
    SWChatViewSideRight,
    SWChatViewSideLeft,
};

@class SacredWhisperContent;
@interface ChatView : UIView
- (id)initWithChat:(SacredWhisperContent *)chat offsetY:(CGFloat)offsetY;
- (CGFloat)setup ;
@end