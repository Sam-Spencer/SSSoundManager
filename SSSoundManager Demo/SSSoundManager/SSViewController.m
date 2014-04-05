//
//  SSViewController.m
//  SSSoundManager
//
//  Created by Sam Spencer on 4/5/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

#import "SSViewController.h"

@interface SSViewController ()

@end

@implementation SSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[SSSpeech sharedSpeaker] setDelegate:self];
    [[SSSpeech sharedSpeaker] speakText:@"Welcome to S S Sound Manager!"];
    
    // NOTE: You may see an error in the log while using AVSpeech- in the iOS Simulator. This is an issue with the iOS 7 Simulator, not SSSpeech. Everything works properly when testing on an actual device.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startedSpeaking {
    // Run this project on an actual device with audio / music playing in the background. Notice how the audio gets ducked.
    // See SSAppDelegate.m for setup details
    [[SSAudioHandler sharedHandler] makeAudioSessionActive:YES];
    
    NSLog(@"Started Speaking");
}

- (void)finishedSpeaking {
    // Run this project on an actual device with audio / music playing in the background. Notice how the audio gets ducked and then goes back to regular volume.
    // See SSAppDelegate.m for setup details
    [[SSAudioHandler sharedHandler] makeAudioSessionActive:NO];
    
    NSLog(@"Finished Speaking");
}

- (IBAction)speakText:(id)sender {
    [[SSSpeech sharedSpeaker] speakText:self.textField.text];
}

@end
