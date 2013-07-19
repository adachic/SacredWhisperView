//
//  SacredWhisperView.m
//  SacredWhisperView
//
//  Created by 安達 彰典 on 06/16/13.
//  Copyright (c) 2013 安達 彰典. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "SacredWhisperView.h"
#import "SacredWhisperRoom.h"
#import "SacredWhisperContent.h"
#import "ChatView.h"


NSString const *SWContentAttributeViewSide = @"viewSide";
NSString const *SWContentAttributeFaceImage = @"faceImage";
NSString const *SWContentAttributeTextBGColor = @"textColor";
NSString const *SWContentAttributeBaseBGColor = @"baseColor";

@interface SacredWhisperView ()
@property(retain) SacredWhisperRoom *room;
@property(retain) NSMutableArray *viewArray;
@property(assign) NSUInteger viewOffsetY;
@end

@implementation SacredWhisperView

#pragma mark - manage room

- (BOOL)openRoom:(NSString *)roomName {
    if (self.room) {
        return NO;
    }
    self.room = [[SacredWhisperRoom alloc] initWithRoomName:roomName];
    [self.room open];
    [self.room addObserver:self
                forKeyPath:@"chats"
                   options:NSKeyValueObservingOptionNew
                   context:nil];
    return YES;
}

- (BOOL)closeRoom:(NSString *)roomName {
    if (!self.room) {
        return NO;
    }
    [self.room close];
    [self.room removeObserver:self
                   forKeyPath:@"chats"];
    self.room = nil;
    return YES;
}

- (void)addChat:(NSString *)caption attributes:(NSDictionary *)attributes {
    if (!self.room) {
        return;
    }
    [self.room addWhisperContentWithCaption:caption attributes:attributes];
}

/* 初回 and データ追加時 */
- (CGFloat)appearChat:(SacredWhisperContent *)chat offsetY:(CGFloat)offsetY {
    ChatView *cv = [[ChatView alloc] initWithChat:chat offsetY:offsetY];
    [self addSubview:cv];
    return [cv setup];
}

- (void)updateViews:(NSMutableArray *)chats {
    CGFloat offsetY = 0;
    for (SacredWhisperContent *chat in chats) {
        offsetY += [self appearChat:chat offsetY:offsetY];
    }
}

#pragma mark - touch event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //KVOのハンドラ
    SacredWhisperRoom *room = object;//オブジェクトごと渡ってくる
    //Viewを更新したりするといいと思う。
//    [self clearViews];
    NSLog(@"KVO chat count:%d",[room.chats count]);
    [self updateViews:room.chats];
}

@end
