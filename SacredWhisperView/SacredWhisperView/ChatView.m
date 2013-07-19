//
// Created by 安達 彰典 on 2013/07/19.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ChatView.h"
#import "SacredWhisperView.h"
#import "SacredWhisperContent.h"

@interface ChatView ()
@property(retain) SacredWhisperContent *chat;

@property(retain) UIImageView *faceImageView;
@property(retain) UIView *contentBaseView;
@property(retain) UITextView *contentTextView;
@property(retain) UILabel *contentTextLabel;
@property(assign) CGFloat offsetOriginY;
@end

@implementation ChatView

- (id)initWithChat:(SacredWhisperContent *)chat offsetY:(CGFloat)offsetY{
    if (self = [super init]) {
        _chat = chat;
        _offsetOriginY = offsetY;
    }
    return self;
}

- (CGFloat)setup {
    if (!self.chat || !self.chat.chat || !self.chat.attributes
            ){
//            || !self.chat.attributes[SWContentAttributeFaceImage]) {
        return 0.0f;
    }
    UIColor *color;

    /* Initialise a base. */
    if (!self.chat.attributes[SWContentAttributeBaseBGColor] || [self.chat.attributes[SWContentAttributeBaseBGColor] class] != [UIColor class]) {
        color = [UIColor blackColor];
    } else {
        color = self.chat.attributes[SWContentAttributeBaseBGColor];
    }
    [self setBackgroundColor:color];

    /* Initialise a chatText. */
    self.contentTextView = [[UITextView alloc] init];
    [self.contentTextView setText:self.chat.chat];
    [self.contentTextView setFont:[UIFont systemFontOfSize:12]];
    SWChatViewSide viewSide;
    [self.chat.attributes[SWContentAttributeViewSide] getValue:&viewSide];
    if (viewSide == SWChatViewSideRight) {
        [self.contentTextView setFrame:CGRectMake(60, _offsetOriginY, 250, self.contentTextView.contentSize.height)];
    } else if (viewSide == SWChatViewSideLeft) {
        [self.contentTextView setFrame:CGRectMake(0, _offsetOriginY, 320 - 50 - 10, self.contentTextView.contentSize.height)];
    }

    /* Initialise a contentBase. */
    self.contentBaseView = [[UIView alloc] initWithFrame:CGRectMake(60, _offsetOriginY, 250, self.contentTextView.contentSize.height)];
    if (!self.chat.attributes[SWContentAttributeTextBGColor] || [self.chat.attributes[SWContentAttributeTextBGColor] class] != [UIColor class]) {
        color = [UIColor whiteColor];
    } else {
        color = self.chat.attributes[SWContentAttributeTextBGColor];
    }
    [self.contentBaseView setBackgroundColor:color];

    /* Initialise a faceImage. */
    self.faceImageView = [[UIImageView alloc] init];
    if (!self.chat.attributes[SWContentAttributeFaceImage] || [self.chat.attributes[SWContentAttributeFaceImage] class] != [UIColor class]) {
        [self.faceImageView setBackgroundColor:[UIColor yellowColor]];
    } else {
        [self.faceImageView setImage:self.chat.attributes[SWContentAttributeFaceImage]];
    }
    if (viewSide == SWChatViewSideRight) {
        [self.faceImageView setFrame:CGRectMake(3, 0, 50, 50)];
    } else if (viewSide == SWChatViewSideLeft) {
        [self.faceImageView setFrame:CGRectMake(267, 0, 50, 50)];
    }

    /* Add subviews. */
    [self addSubview:self.contentBaseView];
    [self addSubview:self.contentTextView];
    [self addSubview:self.faceImageView];

    return self.contentTextView.contentSize.height < 50 ? 50 : self.contentTextView.contentSize.height;
}

- (void)drawRect:(CGRect)rect{
    NSLog(@"hoge");
}

@end