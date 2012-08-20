//
//  ViewController.m
//  MoveButtonTest
//
//  Created by wgdadmin on 12-8-21.
//  Copyright (c) 2012年 wgdadmin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    sharp1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    sharp1.backgroundColor = [UIColor redColor];
    [sharp1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sharp1];
    [sharp1 release];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)click:(UIButton *)sender
{
    NSLog(@"click");
    static int a =0;
    if(a%2 ==0)
    {
        [timer invalidate];
    }
    else
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(move) userInfo:nil repeats:YES];
    }
    a++;
}

-(void)move
{
    static int y = 0;
    y+=10;
    if(y >430)
    {   y= 0;
    }
    sharp1.frame = CGRectMake(165, y, 50, 50);
}
@end
