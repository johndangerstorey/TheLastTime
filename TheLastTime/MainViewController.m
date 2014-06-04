//
//  MainViewController.m
//  TheLastTime
//
//  Created by John D. Storey on 6/3/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) UITextField *displayDate;

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
    UITextField *displayDate = [[UITextField alloc] initWithFrame:CGRectMake(100.0, 150.0, 160.0, 40.0)];
    displayDate.text = @"Date Here";
    [self.view addSubview:displayDate];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(updateDate)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Update Date" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (void)updateDate{
    NSDate *myDate = [NSDate date];
    [[NSUserDefaults standardUserDefaults] setObject:myDate forKey:@"myDateKey"];
    self.displayDate.text = [NSString stringWithFormat:@"%@", myDate];
    NSLog(@"date: %@", myDate);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
