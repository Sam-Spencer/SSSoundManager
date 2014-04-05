//
//  SSAudioHandler.m
//  SSSoundManager
//
//  Created by Sam Spencer on 3/16/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

#if !__has_feature(objc_arc)
    // Add the -fobjc-arc flag to enable ARC for only these files, as described in the ARC documentation: http://clang.llvm.org/docs/AutomaticReferenceCounting.html
    #error SSAudioHandler is built with Objective-C ARC. You must enable ARC for these files.
#endif

#import "SSAudioHandler.h"

@interface SSAudioHandler ()
@property (nonatomic, assign, readwrite) BOOL audioSessionIsActive;
@property (nonatomic, strong, readwrite) AVAudioSession *audioSession;
@end

@implementation SSAudioHandler

+ (SSAudioHandler *)sharedHandler {
    static SSAudioHandler *singleton;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSError *error = NULL;
        if (!_audioSession) _audioSession = [AVAudioSession sharedInstance];
        [_audioSession setCategory:AVAudioSessionCategoryPlayback withOptions:AVAudioSessionCategoryOptionMixWithOthers error:&error];
        if (error) NSLog(@"[SSAudioHandler] %@", error);
        _audioSessionIsActive = NO;
    }
    return self;
}

- (BOOL)setAudioSessionCategory:(NSString *)category withOptions:(AVAudioSessionCategoryOptions)options {
    NSError *error = NULL;
    [self.audioSession setCategory:category withOptions:options error:&error];
    if (error) {
        NSLog(@"[SSAudioHandler] %@", error);
        return NO;
    } else return YES;
}

- (void)makeAudioSessionActive:(BOOL)isActive {
    NSError *error = NULL;
    self.audioSessionIsActive = isActive;
    [self.audioSession setActive:isActive error:&error];
    if (error) NSLog(@"[SSAudioHandler] %@", error);
}

@end
