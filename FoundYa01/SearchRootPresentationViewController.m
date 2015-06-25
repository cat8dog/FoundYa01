//
//  SearchRootPresentationViewController.m
//  FoundYa01
//
//  Created by Catherine Reyto on 2015-06-25.
//  Copyright (c) 2015 Catherine Reyto. All rights reserved.
//

#import "SearchRootPresentationViewController.h"

@interface SearchRootPresentationViewController ()
@property (weak, nonatomic) IBOutlet UIView *centreStage;
@property (weak, nonatomic) IBOutlet UIView *stageRight;
@property (nonatomic, assign) BOOL isShowingStageRight;

@end

@implementation SearchRootPresentationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                       + self.stageRight.frame.size.width,
                                       self.stageRight.frame.origin.y,
                                       self.stageRight.frame.size.width,
                                       self.stageRight.frame.size.height);
    self.isShowingStageRight = NO;
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backSelected:(UIBarButtonItem *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Search Root Presentation View was dissmissed");
    }];
}
- (IBAction)toggleStageRight:(UIBarButtonItem *)sender {
    if (self.isShowingStageRight) {
        self.isShowingStageRight = NO;
        self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                           + self.stageRight.frame.size.width,
                                           self.stageRight.frame.origin.y,
                                           self.stageRight.frame.size.width,
                                           self.stageRight.frame.size.height);
    } else {
        self.isShowingStageRight = YES;
        self.stageRight.frame = CGRectMake(self.stageRight.frame.origin.x
                                           - self.stageRight.frame.size.width,
                                           self.stageRight.frame.origin.y,
                                           self.stageRight.frame.size.width,
                                           self.stageRight.frame.size.height);
    }
}

@end
