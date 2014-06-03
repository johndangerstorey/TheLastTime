//
//  LastTimeViewController.m
//  TheLastTime
//
//  Created by Joshua Howland on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "LastTimeViewController.h"

static NSString * const timeKey = @"time";
static NSString * const activityKey = @"activity";

@interface LastTimeViewController () <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UILabel *timeLabel;
@property (nonatomic, strong) IBOutlet UITextField *activityField;

- (IBAction)buttonPressed:(id)sender;

@end

@implementation LastTimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUserDefaults];
    
}

- (IBAction)buttonPressed:(id)sender {
    self.timeLabel.text = [NSString stringWithFormat:@"was: %@", [[NSDate date] description]];
    
    [self synchronizeUserDefaults];
}

- (void)loadUserDefaults {

    self.activityField.text = [[NSUserDefaults standardUserDefaults] stringForKey:activityKey];
    self.timeLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:timeKey];
    
}

- (void)synchronizeUserDefaults {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.timeLabel.text forKey:timeKey];
    [[NSUserDefaults standardUserDefaults] setObject:self.activityField.text forKey:activityKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

@end
