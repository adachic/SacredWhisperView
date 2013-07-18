//
//  SacredWhisperView.h
//  SacredWhisperView
//
//  Created by 安達 彰典 on 06/16/13.
//  Copyright (c) 2013 安達 彰典. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
* The `SacredWhisperView` is a class provides methods to present the chat view.
 */
@interface SacredWhisperView : UIView

- (BOOL)openRoom:(NSString *)roomName;

- (BOOL)closeRoom:(NSString *)roomName;

- (void)addChat:(NSString *)caption attributes:(NSDictionary *)attributes;

@end



