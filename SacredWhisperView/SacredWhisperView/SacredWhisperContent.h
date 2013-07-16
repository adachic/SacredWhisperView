//
// Created by 安達 彰典 on 2013/07/16.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface SacredWhisperContent : NSObject

@property (assign) SacredWhisperContent *next;
@property (assign) NSUInteger themeType;
@property (retain) NSString *caption;
@property (retain) NSString *content;
@property (retain) NSDictionary* attributes;

+ (SacredWhisperContent *)sacredWhisperContentWithThemeType:(NSUInteger)themeType
                                       caption:(NSString *)caption
                                       content:(NSString *)content
                                    attributes:(NSDictionary *)attributes;

@end