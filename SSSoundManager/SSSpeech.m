//
//  SSSpeech.m
//  SSSoundManager
//
//  Created by Sam Spencer on 3/9/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

#if !__has_feature(objc_arc)
    // Add the -fobjc-arc flag to enable ARC for only these files, as described in the ARC documentation: http://clang.llvm.org/docs/AutomaticReferenceCounting.html
    #error SSSpeech is built with Objective-C ARC. You must enable ARC for these files.
#endif

#import "SSSpeech.h"

@implementation SSSpeech

+ (SSSpeech *)sharedSpeaker {
    static SSSpeech *singleton;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        if (!_speechSynthesizer) _speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
        _speechSynthesizer.delegate = self;
    }
    return self;
}

- (void)speakText:(NSString *)textToSpeak {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:textToSpeak];
    utterance.rate = 0.3;
    
    if (!self.speechSynthesizer) self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self.speechSynthesizer speakUtterance:utterance];
}

- (void)speakTextSlowly:(NSString *)textToSpeak {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:textToSpeak];
    utterance.rate = 0.1;
    
    if (!self.speechSynthesizer) self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self.speechSynthesizer speakUtterance:utterance];
}

- (void)speakTextQuickly:(NSString *)textToSpeak {
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:textToSpeak];
    utterance.rate = 0.6;
    
    if (!self.speechSynthesizer) self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    [self.speechSynthesizer speakUtterance:utterance];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance {
    if ([self.delegate respondsToSelector:@selector(startedSpeaking)]) [self.delegate startedSpeaking];
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    if ([self.delegate respondsToSelector:@selector(finishedSpeaking)]) [self.delegate finishedSpeaking];
}

@end
