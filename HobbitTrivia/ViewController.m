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
bool isSlowing = NO;
bool didMakeChoice = NO;

NSTimer *wheelTimer;
float angleIncrement;
float totalAngle;
int correctChoice;

@synthesize questionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	//[self playSoundtrack];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SpinButtonTouch:(id)sender
{
	
	isSlowing = YES;
	self.SpinButton.enabled = NO;
	
}

- (IBAction)SpinButtonTouchDown:(id)sender
{
	
	angleIncrement = 6;
	isSlowing = NO;
	wheelTimer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(move:) userInfo:nil repeats:YES];
	
}

- (IBAction)doneButtonTouched:(id)sender {
	[self hideQuestion];
}



- (void)move:(id)timer {

	static float angle = 0;
	self.WheelImage.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(angle));
    
	angle += angleIncrement;
	totalAngle += angleIncrement;
	
	if (totalAngle > 360)
	{
		totalAngle = totalAngle - 360;
	}
	
	NSLog(@"Angle - %f, Total Angle - %f", angle, totalAngle);


	if (angleIncrement < 1)
	{
		[wheelTimer invalidate];
		wheelTimer = nil;
		[self showQuestion];
	}
	
	else if (isSlowing)
	{
		float interval = wheelTimer.timeInterval + 0.01f;
		angleIncrement = angleIncrement - .3;
		[wheelTimer invalidate];
		wheelTimer = nil;
		
		wheelTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(move:) userInfo:nil repeats:YES];
	}
	

	
}


- (void) showQuestion
{
	
	didMakeChoice = NO;
	
	NSString *question;
	NSString *answer1;
	NSString *answer2;
	NSString *answer3;
	NSString *answer4;
	
	if (totalAngle > 0.0f && totalAngle < 36.0f)
	{
		question = @"What is another name for the Heart of the Mountain?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 36.0f && totalAngle < 72.0f)
	{
		question = @"What is the name of the Brown Wizard?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 72.0f && totalAngle < 108.0f)
	{
		question = @"Sauron";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 108.0f && totalAngle < 144.0f)
	{
		question = @"Who made the Ring to Rule them All?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 144.0f && totalAngle < 180.0f)
	{
		question = @"What is the name of the Queen of the Elves?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 180.0f && totalAngle < 216.0f)
	{
		question = @"Thorin";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 216.0f && totalAngle < 252.0f)
	{
		question = @"Smaug";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 252.0f && totalAngle < 288.0f)
	{
		question = @"What are the names of the swords...?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (totalAngle > 288.0f && totalAngle < 324.0f)
	{
		question = @"What is Gollums real name?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
		
	}
	
	if (totalAngle > 324.0f && totalAngle < 360.0f)
	{
		question = @"What is the name of the home of the Dwarves?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	
	[self.questionLabel setText:question];
	
	[self.answerLabel1 setTextColor:[UIColor blackColor]];
	[self.answerLabel2 setTextColor:[UIColor blackColor]];
	[self.answerLabel3 setTextColor:[UIColor blackColor]];
	[self.answerLabel4 setTextColor:[UIColor blackColor]];
	
	[self.answerLabel1 setText:answer1];
	[self.answerLabel2 setText:answer2];
	[self.answerLabel3 setText:answer3];
	[self.answerLabel4 setText:answer4];
	
	questionView.transform = CGAffineTransformMakeScale(1.25, 1.25);
	
	[UIView animateWithDuration:0.25 animations:^{
        questionView.alpha = 1;
        questionView.transform = CGAffineTransformIdentity;
    }];
	
	[UIView animateWithDuration:0.25 animations:^{
        self.SpinButton.alpha = 0;
    }];

}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	UITouch *touch = [touches anyObject];
	
	if (!didMakeChoice)
	{
		if(touch.view.tag > 100 && touch.view.tag < 110)
		{
			// touching a label, lets see if its the right touch
			didMakeChoice = YES;
			int selectedAnswer = touch.view.tag - 100;
			UILabel *label = (UILabel*)touch.view;
			if (selectedAnswer == correctChoice)
			{
				[label setTextColor:[UIColor greenColor]];
			} else {
				[label setTextColor:[UIColor redColor]];
			}
			
			// set timer to dismiss the question
			[NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(hideQuestion) userInfo:nil repeats:NO];
		}
	}
		
}


- (void) hideQuestion
{
	[UIView animateWithDuration:0.25 animations:^{
        questionView.alpha = 0;
        questionView.transform = CGAffineTransformMakeScale(1.25, 1.25);
    }];
	
	[UIView animateWithDuration:0.25 animations:^{
        self.SpinButton.alpha = 1;
    }];
	
	self.SpinButton.enabled = YES;
	
}

- (void) playSoundtrack
{
	NSString * musicSonati = [[NSBundle mainBundle] pathForResource:@"soundtrack" ofType:@"mp3"];
	myMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:musicSonati] error:NULL];
	myMusic.numberOfLoops = -1;
	[myMusic play];
}


@end
