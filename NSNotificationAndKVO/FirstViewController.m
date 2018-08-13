//
//  FirstViewController.m
//  NSNotificationAndKVO
//
//  Created by Wiljay Flores on 2018-08-12.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (strong, nonatomic) NSDictionary *stepperKey;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _stepperKey = @{@"stepperValue":[[NSNumber alloc] initWithDouble:self.stepper.value]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    NSNotification *notification = [[NSNotification alloc] initWithName:@"stepperNotification" object:sender userInfo:self.stepperKey];
    [notificationCenter postNotification:notification];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
