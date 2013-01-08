//
//  ViewController.m
//  HobbitQuiz
//
//  Created by James Rutherford on 2013-01-07.
//  Copyright (c) 2013 Braxio Interactive. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)



@interface ViewController ()

@end


@implementation ViewController

AVAudioPlayer * myMusic;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	[self playSoundtrack];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

bool isSlowing = NO;
NSTimer *wheelTimer;
float angleIncrement;
float angle = 0;

- (IBAction)SpinButtonTouch:(id)sender
{
	
	isSlowing = YES;
}

- (IBAction)SpinButtonTouchDown:(id)sender
{
	
	angleIncrement = 9;
	isSlowing = NO;
	wheelTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(move:) userInfo:nil repeats:YES];
	
}



- (void)move:(id)timer {

	self.WheelImage.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(angle));
    angle += angleIncrement;
	
	if (angle > 360)
	{
		angle = angle - 360;
	}
	
	if (isSlowing)
	{
		float interval = wheelTimer.timeInterval + 0.01f;
		angleIncrement = angleIncrement - .3;
		[wheelTimer invalidate];
		wheelTimer = nil;
		
		wheelTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(move:) userInfo:nil repeats:YES];
	}
	
	if (angleIncrement < 1)
	{
		[wheelTimer invalidate];
		wheelTimer = nil;
		[self showQuestion];
	}
	
}


- (void) showQuestion
{
	
	int category = (int)floor(angle / 36.0f);
	NSLog(@"category %i", category);

}

- (void) playSoundtrack
{
	NSString * musicSonati = [[NSBundle mainBundle] pathForResource:@"soundtrack" ofType:@"mp3"];
	myMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:musicSonati] error:NULL];
	//myMusic.delegate = self;
	myMusic.numberOfLoops = -1;
	[myMusic play];
}


@end
