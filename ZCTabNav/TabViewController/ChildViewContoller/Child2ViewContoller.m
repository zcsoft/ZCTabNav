//
//  Child2ViewContoller.m
//  ZCTabNavFramework
//
//  Created by cuibo on 5/7/15.
//  Copyright (c) 2015 cuibo. All rights reserved.
//

#import "Child2ViewContoller.h"

@interface Child2ViewContoller ()

@property(weak, nonatomic) IBOutlet UIImageView *image;         //图片
@property(weak, nonatomic) IBOutlet UIButton *dismissButton;    //dismiss按钮

@end


@implementation Child2ViewContoller

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"Child2ViewContollerChild";
    
    UINavigationController *nav = self.navigationController;
    if(nav != nil)
        self.dismissButton.hidden = YES;
    
    self.navigationItem.rightBarButtonItem = [self createRightButton];
}

//创建一个返回按钮
-(UIBarButtonItem*) createRightButton
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"Right";
    backItem.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    return backItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//移动图片到触摸点
- (void)movedImageWithTouch:(UITouch *)touch
{
    if([self.view pointInside:[touch locationInView:self.view] withEvent:nil])
    {
        CGPoint currentLocation = [touch locationInView:self.view];
        self.image.center = currentLocation;
    }
}

- (IBAction)buttonAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - Touche

//触摸开始
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    [self movedImageWithTouch:touch];
}

//手指移动
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    [self movedImageWithTouch:touch];
}


@end


