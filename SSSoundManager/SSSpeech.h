//
//  SSSpeech.h
//  SSSoundManager
//
//  Created by Sam Spencer on 3/9/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

@import Foundation;
@import AVFoundation;

#ifndef __IPHONE_7_0
    #error SSSpeech uses features only available in iOS SDK 7.0 and later.
#endif

/** Informs the delegate of speech events 
 @discussion The delegate methods provided here are useful for ducking audio / music plyback and performing any other speech-related operations while the text is being synthesized. */
@protocol SSSpeechDelegate <NSObject>

/// Sent to the delegate when a speech begins
- (void)finishedSpeaking;

/// Sent to the delegate when a speech ends
- (void)startedSpeaking;

@end


/// Synthesizes text for speaking (audio feedback)
NS_CLASS_AVAILABLE_IOS(7_0) @interface SSSpeech : NSObject <AVSpeechSynthesizerDelegate>


/// A shared instance of SSSpeech
+ (SSSpeech *)sharedSpeaker;


/// SSSpeechDelegate property used to set the delegate
@property (nonatomic, assign) id <SSSpeechDelegate> delegate;


/** Synthesizes the provided text and speaks it at a moderate rate.
 @param textToSpeak The text to be spoken */
- (void)speakText:(NSString *)textToSpeak;


/** Synthesizes the provided text and speaks it very slowly.
 @param textToSpeak The text to be spoken */
- (void)speakTextSlowly:(NSString *)textToSpeak;


/** Synthesizes the provided text and speaks it very quickly.
 @param textToSpeak The text to be spoken */
- (void)speakTextQuickly:(NSString *)textToSpeak;


/// The AVSpeechSynthesizer used to speak text
@property (nonatomic, strong) AVSpeechSynthesizer *speechSynthesizer;


@end
