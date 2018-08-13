//
//  SecondViewController.m
//  NSNotificationAndKVO
//
//  Created by Wiljay Flores on 2018-08-12.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(getStepper:) name:@"stepperNotification" object:nil];
    self.countLabel.text = [NSString stringWithFormat:@"%.0f",0.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getStepper:(NSNotification *)notification{
    if([[notification name] isEqualToString:@"stepperNotification"]){
        NSDictionary *userInfo = notification.userInfo;
        UIStepper *stepper = userInfo[@"stepperValue"];
        self.countLabel.text = [NSString stringWithFormat:@"%.0f",stepper.value];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
