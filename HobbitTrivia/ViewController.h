//
//  ViewController.h
//  HobbitQuiz
//
//  Created by James Rutherford on 2013-01-07.
//  Copyright (c) 2013 Braxio Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *WheelImage;
@property (weak, nonatomic) IBOutlet UIButton *SpinButton;
- (IBAction)SpinButtonTouch:(id)sender;
- (IBAction)SpinButtonTouchDown:(id)sender;

@end
