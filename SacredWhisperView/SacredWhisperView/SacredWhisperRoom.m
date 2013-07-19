//
// Created by 安達 彰典 on 2013/07/16.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "SacredWhisperRoom.h"
#import "SacredWhisperContent.h"
#import "ChatStore.h"

@interface SacredWhisperRoom ()
@property(retain) ChatStore *chatStore;
@property(retain) NSString *roomName;
@end

@implementation SacredWhisperRoom

- (id)initWithRoomName:(NSString *)roomName {
    if (self = [super init]) {
        _chatStore = [[ChatStore alloc] init];
        _roomName = roomName;
    }
    return self;
}

- (void)open {
    self.chats = [self.chatStore read:self.roomName];
}

- (void)close {
    [self.chatStore writeWithRoomName:self.roomName chats:self.chats];
}

- (void)performFilter:(NSString *)expression {
}

- (void)addWhisperContentWithCaption:(NSString *)caption
                          attributes:(NSDictionary *)attributes {
    SacredWhisperContent *content = [[SacredWhisperContent alloc] init];
    content.attributes = attributes;
    content.chat = caption;
    NSMutableArray *chats = self.chats;
    [chats addObject:content];
    self.chats = chats;
}

@end