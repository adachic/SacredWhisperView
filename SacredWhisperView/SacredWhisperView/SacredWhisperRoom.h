//
// Created by 安達 彰典 on 2013/07/16.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SacredWhisperContent;

@interface SacredWhisperRoom : NSObject

@property(retain) NSMutableArray *chats;

- (id)initWithRoomName:(NSString *)roomName;

- (void)open;

- (void)close;

- (void)performFilter:(NSString *)expression;

- (void)addWhisperContentWithCaption:(NSString *)caption
                          attributes:(NSDictionary *)attributes;
@end