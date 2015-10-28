//
//  ViewController.h
//  CalculatorAIESEC
//
//  Created by Enrique O Hernandez on 10/26/15.
//  Copyright (c) 2015 NLCJohn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)b0:(id)sender;
- (IBAction)bEq:(id)sender;
- (IBAction)bMin:(id)sender;
- (IBAction)dDot:(id)sender;
- (IBAction)bPlus:(id)sender;
- (IBAction)bMult:(id)sender;
- (IBAction)bPlusMin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tfDisplay;
- (IBAction)bDiv:(id)sender;
- (IBAction)bC:(id)sender;
- (IBAction)b1:(id)sender;
- (IBAction)b2:(id)sender;
- (IBAction)b3:(id)sender;
- (IBAction)b4:(id)sender;
- (IBAction)b5:(id)sender;
- (IBAction)b6:(id)sender;
- (IBAction)b7:(id)sender;
- (IBAction)b8:(id)sender;
- (IBAction)b9:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *boPlus;
@property (weak, nonatomic) IBOutlet UIButton *boMin;
@property (weak, nonatomic) IBOutlet UIButton *boMult;
@property (weak, nonatomic) IBOutlet UIButton *boDiv;

@end

