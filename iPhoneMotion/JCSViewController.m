//
//  JCSViewController.m
//  iPhoneMotion
//
//  Created by Jaicob Stewart on 8/26/14.
//  Copyright (c) 2014 Jaicob Stewart. All rights reserved.
//

@import CoreMotion;
#import "JCSViewController.h"

@interface JCSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rotationXLabel;
@property (weak, nonatomic) IBOutlet UILabel *rotationYLabel;
@property (weak, nonatomic) IBOutlet UILabel *rotationZLabel;
@property (weak, nonatomic) IBOutlet UILabel *accelerationLabelX;
@property (weak, nonatomic) IBOutlet UILabel *accelerationLabelY;
@property (weak, nonatomic) IBOutlet UILabel *accelerationLabelZ;
@property (nonatomic,strong) CMMotionManager *motionManager;
@end

@implementation JCSViewController

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
    NSLog(@"Manager generated");

    self.motionManager = [[CMMotionManager alloc]init];
    
    self.motionManager.gyroUpdateInterval = .2;
    self.motionManager.accelerometerUpdateInterval = .2;
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        NSLog(@"Rotation detected");
        self.rotationXLabel.text = [NSString stringWithFormat:@"%.2f",gyroData.rotationRate.x];
        self.rotationYLabel.text = [NSString stringWithFormat:@"%.2f",gyroData.rotationRate.y];
        self.rotationZLabel.text = [NSString stringWithFormat:@"%.2f",gyroData.rotationRate.z];
    }];
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        self.accelerationLabelX.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.x];
        self.accelerationLabelY.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.y];
        self.accelerationLabelZ.text = [NSString stringWithFormat:@"%.2f",accelerometerData.acceleration.z];
    }];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
