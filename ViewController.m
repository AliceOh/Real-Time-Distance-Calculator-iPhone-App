//
//  ViewController.m
//  DistanceCalculator
//
//  Created by wikigainoh on 22/11/17.
//  Copyright © 2017 HelloWorldCop. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *startLocation;
@property (weak, nonatomic) IBOutlet UITextField *endLocationA;
@property (weak, nonatomic) IBOutlet UILabel *distancA;
@property (weak, nonatomic) IBOutlet UITextField *endLocationB;
@property (weak, nonatomic) IBOutlet UILabel *distanceB;
@property (weak, nonatomic) IBOutlet UITextField *endLocationC;
@property (weak, nonatomic) IBOutlet UILabel *distanceC;
@property (weak, nonatomic) IBOutlet UITextField *endLocationD;
@property (weak, nonatomic) IBOutlet UILabel *distanceD;


@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *unitController;

@end

@implementation ViewController

- (IBAction)calculateButtonTapped:(id)sender
{
    self.calculateButton.enabled = NO;
    self.req = [DGDistanceRequest alloc];
    NSString *start = self.startLocation.text;
    NSString *destA = self.endLocationA.text;
    NSString *destB = self.endLocationB.text;
    NSString *destC = self.endLocationC.text;
    NSString *destD = self.endLocationD.text;
    NSArray *dests = @[destA, destB, destC, destD];
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    __weak ViewController *weakSelf = self;
    
    self.req.callback = ^void(NSArray *responses)
    {
        ViewController *strongSelf = weakSelf;
        if(!strongSelf) return;
        
        NSNull *badResult = [NSNull null];
        
        if(responses[0]!=badResult)
        {
            double num=0;
            NSString *temp;
            if(strongSelf.unitController.selectedSegmentIndex == 0)
            {
                num = [responses[0] floatValue]/1.0;
                temp=[NSString stringWithFormat:@"%.2f Ms", num];
            }
            else if(strongSelf.unitController.selectedSegmentIndex == 1)
            {
                num = [responses[0] floatValue]/1000.0;
                temp=[NSString stringWithFormat:@"%.2f KMs", num];
            }
            else
            {
                num = [responses[0] floatValue]/1609.34;
                temp=[NSString stringWithFormat:@"%.2f miles", num];
                
            }
            strongSelf.distancA.text = temp;
            
        }
        else
        {
            strongSelf.distancA.text = @"Error";
        }
        
        if(responses[1]!=badResult)
        {
            double num=0;
            NSString *temp;
            if(strongSelf.unitController.selectedSegmentIndex == 0)
            {
                num = [responses[1] floatValue]/1.0;
                temp=[NSString stringWithFormat:@"%.2f Ms", num];
            }
            else if(strongSelf.unitController.selectedSegmentIndex == 1)
            {
                num = [responses[1] floatValue]/1000.0;
                temp=[NSString stringWithFormat:@"%.2f KMs", num];
            }
            else
            {
                num = [responses[1] floatValue]/1609.34;
                temp=[NSString stringWithFormat:@"%.2f miles", num];
                
            }
            strongSelf.distanceB.text = temp;
        }
        else
        {
            strongSelf.distanceB.text = @"Error";
        }
        
        if(responses[2]!=badResult)
        {
            double num=0;
            NSString *temp;
            if(strongSelf.unitController.selectedSegmentIndex == 0)
            {
                num = [responses[2] floatValue]/1.0;
                temp=[NSString stringWithFormat:@"%.2f Ms", num];
            }
            else if(strongSelf.unitController.selectedSegmentIndex == 1)
            {
                num = [responses[2] floatValue]/1000.0;
                temp=[NSString stringWithFormat:@"%.2f KMs", num];
            }
            else
            {
                num = [responses[2] floatValue]/1609.34;
                temp=[NSString stringWithFormat:@"%.2f miles", num];
                
            }
            strongSelf.distanceC.text = temp;
        }
        else
        {
            strongSelf.distanceC.text = @"Error";
        }
        
        if(responses[3]!=badResult)
        {
            double num3=0;
            NSString *temp3;
            if(strongSelf.unitController.selectedSegmentIndex == 0)
            {
                num3 = [responses[3] floatValue]/1.0;
                temp3=[NSString stringWithFormat:@"%.2f Ms", num3];
            }
            else if(strongSelf.unitController.selectedSegmentIndex == 1)
            {
                num3 = [responses[3] floatValue]/1000.0;
                temp3=[NSString stringWithFormat:@"%.2f KMs", num3];
            }
            else
            {
                num3 = [responses[3] floatValue]/1609.34;
                temp3=[NSString stringWithFormat:@"%.2f miles", num3];
                
            }
            strongSelf.distanceD.text = temp3;
            
        }
        else
        {
            strongSelf.distanceD.text = @"Error";
        }
        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
        
    };
    
    [self.req start];
      
}


@end
