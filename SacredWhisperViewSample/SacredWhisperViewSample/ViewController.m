//
//  ViewController.m
//  SacredWhisperViewSample
//
//  Created by 安達 彰典 on 06/17/13.
//  Copyright (c) 2013 com.regaria. All rights reserved.
//

#import "ViewController.h"
#import <SacredWhisperView/SacredWhisperView.h>

@interface ViewController ()
@property SacredWhisperView *chatView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.chatView = [[SacredWhisperView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];

    [self.chatView openRoom:@"1"];

    NSDictionary *attribute = @{
            SWContentAttributeViewSide : @0,
//            SWContentAttributeTextBGColor : ,
//            SWContentAttributeViewSide : @0,
//            SWContentAttributeFaceImage : @0
    };
    [self.chatView addChat:@"test" attributes:attribute];
    [self.view addSubview:self.chatView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
