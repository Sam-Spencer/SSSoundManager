//
//  SSViewController.h
//  SSSoundManager
//
//  Created by Sam Spencer on 4/5/14.
//  Copyright (c) 2014 Sam Spencer. All rights reserved.
//

@import UIKit;

#import "SSSpeech.h"
#import "SSAudioHandler.h"

@interface SSViewController : UIViewController <SSSpeechDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)speakText:(id)sender;

@end
