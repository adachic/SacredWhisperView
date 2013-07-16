//
// Created by 安達 彰典 on 2013/07/17.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface AncientSoulsKeeper : NSObject
+ (NSData *)read:(NSString *)roomName;
+ (void)writeWithRoomName:(NSString *)roomName data:(NSData *)data;
+ (void)appendWithRoomName:(NSString *)roomName data:(NSData *)data;
@end