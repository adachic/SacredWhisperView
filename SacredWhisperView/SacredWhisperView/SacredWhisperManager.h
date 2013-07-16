//
// Created by 安達 彰典 on 2013/07/16.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class SacredWhisperContent;
@class SacredWhisperRoom;

@interface SacredWhisperManager : NSObject

@property(retain) NSArray *roomList;

- (void)createRoom:(NSString *)roomName;

- (void)openRoom:(NSString *)roomName;

- (void)closeRoom:(NSString *)roomName;

- (void)addWhisperContent:(NSString *)roomName
                themeType:(NSUInteger)themeType
                  caption:(NSString *)caption
                  content:(NSString *)content
               attributes:(NSDictionary *)attributes;

- (void)performFilter:(NSString *)query;

@end