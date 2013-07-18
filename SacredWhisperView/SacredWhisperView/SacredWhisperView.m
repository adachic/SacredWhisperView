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

@interface SacredWhisperView ()
@property(retain) SacredWhisperRoom *room;
@end

@implementation SacredWhisperView

#pragma mark - manage room

- (BOOL)openRoom:(NSString *)roomName {
    if (self.room) {
        return NO;
    }
    self.room = [[SacredWhisperRoom alloc] initWithRoomName:roomName];
    [self.room addObserver:self
                forKeyPath:@"chats"
                   options:nil
                   context:nil];
    [self.room open];
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

- (void)addChat:(NSString *)caption attributes:(NSDictionary *)attributes{
    if (!self.room){
        return;
    }
    [self.room addWhisperContentWithCaption:caption attributes:attributes];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //KVOのハンドラ
    NSMutableArray* chats = object;//オブジェクトごと渡ってくる
    //Viewを更新したりするといいと思う。

}

@end
