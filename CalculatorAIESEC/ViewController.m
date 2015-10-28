//
//  ViewController.m
//  CalculatorAIESEC
//
//  Created by Enrique O Hernandez on 10/26/15.
//  Copyright (c) 2015 NLCJohn. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

bool decimal = false;
bool plus = false;
bool minus = false;
bool mult = false;
bool division = false;
bool clearDisplay = false;

//Acumulator
CGFloat acum = 0.0;
//Past acumulator for presing equal button many times
CGFloat acumPast = 0.0;
//Keep record which was the last math function used
NSInteger past = 0;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tfDisplay.text = [NSString stringWithFormat: @"0"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)b0:(id)sender {
    
    if(([self.tfDisplay.text floatValue] != 0.0 || decimal) && !clearDisplay )
        self.tfDisplay.text = [NSString stringWithFormat: @"%@%@", self.tfDisplay.text, @"0"];
    else if(clearDisplay){
        self.tfDisplay.text = [NSString stringWithFormat: @"%@", @"0"];
        clearDisplay = false;
    }
}


- (IBAction)bEq:(id)sender {
    
    [self resetButtons];
    [self doMath];
    [self resetValues];
    //decimal = false;

}

- (IBAction)bMin:(id)sender {
    
    past = 0;
    [self resetButtons];
    [self doMath];
    [self resetValues];
    
    acum = (CGFloat)[self.tfDisplay.text floatValue];
    [self.boMin.layer setBorderWidth:2.0];
    [self.boMin.layer setBorderColor:[[UIColor blackColor] CGColor]];
    minus = true;
    clearDisplay = true;
}

- (IBAction)dDot:(id)sender {
    
    if(!clearDisplay)
        self.tfDisplay.text = [NSString stringWithFormat: @"%@%@", self.tfDisplay.text, @"."];
    else{
        self.tfDisplay.text = [NSString stringWithFormat: @"%@", @"0."];
        clearDisplay = false;
    }
    
    decimal = true;
}

- (IBAction)bPlus:(id)sender {
    
    past = 0;
    [self resetButtons];
    [self doMath];
    [self resetValues];
    
    acum = (CGFloat)[self.tfDisplay.text floatValue];
    [self.boPlus.layer setBorderWidth:2.0];
    [self.boPlus.layer setBorderColor:[[UIColor blackColor] CGColor]];
    plus = true;
    clearDisplay = true;
}

- (IBAction)bMult:(id)sender {
    
    past = 0;
    [self resetButtons];
    [self doMath];
    [self resetValues];
    
    acum = (CGFloat)[self.tfDisplay.text floatValue];
    [self.boMult.layer setBorderWidth:2.0];
    [self.boMult.layer setBorderColor:[[UIColor blackColor] CGColor]];
    mult = true;
    clearDisplay = true;
}

- (IBAction)bPlusMin:(id)sender {
    if([self.tfDisplay.text floatValue] != 0.0)
        self.tfDisplay.text = [NSString stringWithFormat: @"%g", ([self.tfDisplay.text floatValue] * (- 1))];

}

- (IBAction)bDiv:(id)sender {
    
    past = 0;
    [self resetButtons];
    [self doMath];
    [self resetValues];
    
    acum = (CGFloat)[self.tfDisplay.text floatValue];
    [self.boDiv.layer setBorderWidth:2.0];
    [self.boDiv.layer setBorderColor:[[UIColor blackColor] CGColor]];
    division = true;
    clearDisplay = true;
}

- (IBAction)bC:(id)sender {
    
    self.tfDisplay.text = @"0";
    [self resetButtons];
    [self resetValues];
    decimal = false;
    past = 0;

}

- (void) printScreen:(NSString*) number{
    
    if(([self.tfDisplay.text floatValue] == 0.0 && !decimal) || clearDisplay){
        self.tfDisplay.text = number;
        clearDisplay = false;
    }
    else
        self.tfDisplay.text = [NSString stringWithFormat: @"%@%@",self.tfDisplay.text, number];
}

-(void) doMath{
    
    if(plus){
        acumPast = [self.tfDisplay.text floatValue];
        self.tfDisplay.text = [NSString stringWithFormat: @"%g", (acum + [self.tfDisplay.text floatValue])];
        past = 1;
    }
    else if(minus){
        acumPast = [self.tfDisplay.text floatValue];
        self.tfDisplay.text = [NSString stringWithFormat: @"%g", (acum - [self.tfDisplay.text floatValue])];
        past = 2;
    }
    else if (mult){
        acumPast = [self.tfDisplay.text floatValue];
        NSString* text =[NSString stringWithFormat: @"%g", (acum * [self.tfDisplay.text floatValue])];
        if([text  isEqual: @"-0"])
            self.tfDisplay.text = @"0";
        else
            self.tfDisplay.text = text;
        past = 3;
    }
    else if(division){
        acumPast = [self.tfDisplay.text floatValue];
        NSString* text = [NSString stringWithFormat: @"%g", (acum / [self.tfDisplay.text floatValue])];
        if([text  isEqual: @"inf"] || [text  isEqual: @"-inf"])
            self.tfDisplay.text = @"Error";
        else
            self.tfDisplay.text = text;
        past = 4;
        
    }else{
        
        if(past == 1){
            self.tfDisplay.text = [NSString stringWithFormat: @"%g", (acumPast + [self.tfDisplay.text floatValue])];
        }
        else if(past == 2){
            self.tfDisplay.text = [NSString stringWithFormat: @"%g", ([self.tfDisplay.text floatValue]) - acumPast];
        }
        else if (past == 3){
            self.tfDisplay.text = [NSString stringWithFormat: @"%g", (acumPast * [self.tfDisplay.text floatValue])];
        }
        else if(past == 4){
            self.tfDisplay.text = [NSString stringWithFormat: @"%g", ([self.tfDisplay.text floatValue]) / acumPast];
        }
    }
    
}

-(void) resetButtons{
    
    [self.boPlus.layer setBorderWidth:0];
    [self.boDiv.layer setBorderWidth:0];
    [self.boMin.layer setBorderWidth:0];
    [self.boMult.layer setBorderWidth:0];
    
}
-(void) resetValues{
    
    plus = false;
    minus = false;
    mult = false;
    division = false;

}

- (IBAction)b1:(id)sender {

    [self printScreen:@"1"];
}

- (IBAction)b2:(id)sender {
    
    [self printScreen:@"2"];
}

- (IBAction)b3:(id)sender {
    
   [self printScreen:@"3"];
}

- (IBAction)b4:(id)sender {
    
    [self printScreen:@"4"];
}

- (IBAction)b5:(id)sender {
    
    [self printScreen:@"5"];
}

- (IBAction)b6:(id)sender {
    
    [self printScreen:@"6"];
}

- (IBAction)b7:(id)sender {
    
    [self printScreen:@"7"];
}

- (IBAction)b8:(id)sender {
    
    [self printScreen:@"8"];
}

- (IBAction)b9:(id)sender {
    
    [self printScreen:@"9"];
}

@end
