//
// Created by 安達 彰典 on 2013/07/17.
// Copyright (c) 2013 ___FULLUSERNAME___. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ChatStore.h"

const NSString *CSStoreDirectoryPath = @"Documents";

@interface ChatStore ()
@property(retain) dispatch_semaphore_t sem;
@end

@implementation ChatStore

- (id)init{
    if(self = [super init]){
        _sem = dispatch_semaphore_create(1);
    }
    return self;
}

- (NSString *)makeFilenameWithRoomName:(NSString *)roomName {
    return roomName;
}

- (NSMutableArray *)read:(NSString *)roomName {
    NSMutableArray *mArray;
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
    {
        mArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self makeFilenameWithRoomName:roomName]];
    }
    dispatch_semaphore_signal(self.sem);
    return mArray;
}

- (void)writeWithRoomName:(NSString *)roomName chats:(NSMutableArray *)chats {
    dispatch_semaphore_wait(self.sem, DISPATCH_TIME_FOREVER);
    {
        NSString *directory = [NSHomeDirectory() stringByAppendingPathComponent:CSStoreDirectoryPath];
        NSString *filePath = [directory stringByAppendingPathComponent:[self makeFilenameWithRoomName:roomName]];
        [NSKeyedArchiver archiveRootObject:chats toFile:filePath];
    }
    dispatch_semaphore_signal(self.sem);
}

@end