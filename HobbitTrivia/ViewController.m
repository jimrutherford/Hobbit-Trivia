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
static float angle = 0;
float angleIncrement;
int correctChoice;

@synthesize questionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self playSoundtrack];
}


#pragma mark - Button Handlers

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

#pragma mark - Animations

- (void)move:(id)timer {
	self.WheelImage.transform = CGAffineTransformMakeRotation(DEGREES_TO_RADIANS(angle));
    
	angle += angleIncrement;

	// we never need our angle to be larger than 360 - adjust it
	if (angle > 360) angle = angle - 360;
	
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

#pragma mark - Questions and Answers

- (void) showQuestion
{
	didMakeChoice = NO;
	
	NSString *question;
	NSString *answer1;
	NSString *answer2;
	NSString *answer3;
	NSString *answer4;
	
	if (angle > 0.0f && angle < 36.0f)
	{
		question = @"What is another name for the Heart of the Mountain?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 36.0f && angle < 72.0f)
	{
		question = @"What is the name of the Brown Wizard?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 72.0f && angle < 108.0f)
	{
		question = @"Sauron";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 108.0f && angle < 144.0f)
	{
		question = @"Who made the Ring to Rule them All?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 144.0f && angle < 180.0f)
	{
		question = @"What is the name of the Queen of the Elves?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 180.0f && angle < 216.0f)
	{
		question = @"Thorin";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 216.0f && angle < 252.0f)
	{
		question = @"Smaug";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 252.0f && angle < 288.0f)
	{
		question = @"What are the names of the swords...?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	if (angle > 288.0f && angle < 324.0f)
	{
		question = @"What is Gollums real name?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
		
	}
	
	if (angle > 324.0f && angle < 360.0f)
	{
		question = @"What is the name of the home of the Dwarves?";
		answer1 = @"Answer_1";
		answer2 = @"Answer_2";
		answer3 = @"Answer_3";
		answer4 = @"Answer_4";
		correctChoice = 1;
	}
	
	
	[self.questionLabel setText:question];
	
	// set all of our answers to black text
	[self.answerLabel1 setTextColor:[UIColor blackColor]];
	[self.answerLabel2 setTextColor:[UIColor blackColor]];
	[self.answerLabel3 setTextColor:[UIColor blackColor]];
	[self.answerLabel4 setTextColor:[UIColor blackColor]];
	
	// set the answer label text
	[self.answerLabel1 setText:answer1];
	[self.answerLabel2 setText:answer2];
	[self.answerLabel3 setText:answer3];
	[self.answerLabel4 setText:answer4];
	
	// setup our initial animation state - make the view a bit bigger so we can zoom it down
	questionView.transform = CGAffineTransformMakeScale(1.25, 1.25);
	
	[UIView animateWithDuration:0.25 animations:^{
        questionView.alpha = 1;
        questionView.transform = CGAffineTransformIdentity;
    }];
	
	// get rid of the spin buton
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
			
			// set the frame position of the background image for feedback on correct/incorrect answer.  Offset it by 6 pixels below the top of the answer label.
			CGRect answerFrame = CGRectMake(self.answerBG.frame.origin.x, label.frame.origin.y + 6, self.answerBG.frame.size.width, self.answerBG.frame.size.height);
			
			self.answerBG.frame = answerFrame;
			
			// set the background image based on if our choice is correct
			if (selectedAnswer == correctChoice)
			{
				[self.answerBG setImage:[UIImage imageNamed:@"CorrectAnswerBG"]];
			} else {
				[self.answerBG setImage:[UIImage imageNamed:@"WrongAnswerBG"]];
			}
			
			// lets animate the background in
			[UIView animateWithDuration:0.25 animations:^{
				self.answerBG.alpha = 1;
				label.textColor = [UIColor whiteColor];
			}];
			
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
	
	[self.answerBG setAlpha:0.0f];
	
}

#pragma mark - Audio Handling

- (void) playSoundtrack
{
	NSString * musicSonati = [[NSBundle mainBundle] pathForResource:@"soundtrack" ofType:@"mp3"];
	myMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:musicSonati] error:NULL];
	myMusic.numberOfLoops = -1;
	[myMusic play];
}

#pragma mark - Cleanup

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
