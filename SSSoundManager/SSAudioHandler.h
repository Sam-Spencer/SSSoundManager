//
//  SSAudioHandler.h
//  SSSoundManager
//
//  Created by Sam Spencer on 3/16/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

@import Foundation;
@import AVFoundation;

@interface SSAudioHandler : NSObject

/// Returns a shared instance of the current audio handler object.
+ (SSAudioHandler *)sharedHandler;


/// The single audio session handled by the current handler object.
@property (nonatomic, strong, readonly) AVAudioSession *audioSession;


/// Indicates whether or not the \p audioSession is active.
@property (nonatomic, assign, readonly) BOOL audioSessionIsActive;


/** Sets the audio session category with the specified options.
 
 @param category The audio session category you want to apply to the audio session. For a list of values, see “Audio Session Categories”.
 @param options A mask of additional options for handling audio. For a list of constants, see “AVAudioSessionCategoryOptions”
 
 @return YES if the process is a success. NO if it is not. */
- (BOOL)setAudioSessionCategory:(NSString *)category withOptions:(AVAudioSessionCategoryOptions)options;


/** Sets the audio session to active or inactive.
 
 @discussion Audio session activity interacts with the audio session categories and related options. Review documentation to understand how different categories and options work with inactivity / activity.
 
 @param isActive Pass YES if the audio session should activate. NO if the audio session should become inactive. */
- (void)makeAudioSessionActive:(BOOL)isActive;

@end
