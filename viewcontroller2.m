//
//  viewcontroller2.m
//  progressbar
//
//  Created by abc on 7/17/17.
//  Copyright © 2017 hArsh. All rights reserved.
//

#import "viewcontroller2.h"

@interface viewcontroller2 ()
{
    NSArray *img;
    NSInteger x,y,Location,cLocation,myCurrentPage,CurrentPage,rateMember;
    UIButton *NEXTimg;
    UIView *myPageView;
    UIPageControl * pageControl;
    
    BOOL condition;
}
@end

@implementation viewcontroller2

- (void)viewDidLoad
{
    [super viewDidLoad];
    x=0;
    y=0;
    Location=self.view.frame.size.width;
    [self.MyScrolViewIMG delaysContentTouches];
    
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft)];
    recognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.MyScrolViewIMG addGestureRecognizer:recognizerLeft];
    [self.MyScrolViewIMG.panGestureRecognizer requireGestureRecognizerToFail:recognizerLeft];
    
    
    UISwipeGestureRecognizer *recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight)];
    recognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.MyScrolViewIMG addGestureRecognizer:recognizerRight];
    [self.MyScrolViewIMG.panGestureRecognizer requireGestureRecognizerToFail:recognizerRight];
    
    
    
    
    
    img = [NSArray arrayWithObjects:@"moong-dal-fry-recipe.jpg",@"dal-fry-recipe13.jpg",@"moong-dal-fry-recipe.jpg",@"8659256133_5889f08fe8_b.jpg",@"Sethji-Home-Made-Food-Restaurant-Menu.jpg", nil];
    
    
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.MyScrolViewIMG.frame.size.width*0.13, self.MyScrolViewIMG.frame.size.height*.8,self.MyScrolViewIMG.frame.size.width*0.74, self.MyScrolViewIMG.frame.size.height*.2)];
    
    
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    pageControl.numberOfPages=img.count;
    
    [self.ContentView addSubview:pageControl];
    
    self.MyScrolViewIMG.pagingEnabled=YES;
    
    
    
    for (int i=0; i<img.count; i++)
    {
        NEXTimg=[[UIButton alloc]initWithFrame:CGRectMake(x, y, self.MyScrolViewIMG.frame.size.width, self.MyScrolViewIMG.frame.size.height) ];
        [NEXTimg setBackgroundImage:[UIImage imageNamed:[img objectAtIndex:i]] forState:UIControlStateNormal];
        
        [self.MyScrolViewIMG addSubview:NEXTimg];
        
        x+=NEXTimg.frame.size.width;
        
        
        
    }
    
    [self.MyScrolViewIMG setContentSize:CGSizeMake(x, self.MyScrolViewIMG.frame.size.height)];
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    ////END VIEDIDLOAD
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onTimer {
    
    
    myCurrentPage++;
    cLocation+=self.view.frame.size.width;
    if (cLocation>=img.count*self.view.frame.size.width)
    {
        
        cLocation=0;
        myCurrentPage=0;
        
    }
    pageControl.currentPage=myCurrentPage;
    
    self.MyScrolViewIMG.contentOffset = CGPointMake(cLocation, 0);
    
    
    
    
}

-(void)handleSwipeLeft
{    NSLog(@"hello left next");
    
    
    myCurrentPage++;
    cLocation=Location * myCurrentPage;
    
    if (cLocation>=img.count*self.view.frame.size.width)
    {
        
        cLocation=0;
        myCurrentPage=0;
        
    }
    pageControl.currentPage=myCurrentPage;
    
    self.MyScrolViewIMG.contentOffset = CGPointMake(cLocation, 0);
    
}
-(void)handleSwipeRight
{
    NSLog(@"hello right last");
    myCurrentPage--;
    cLocation-=self.view.frame.size.width;
    
    
    if (cLocation<=0)
    {
        
        int temp =img.count*self.view.frame.size.width;
        cLocation=temp-self.view.frame.size.width;
        myCurrentPage=img.count;
        myCurrentPage--;
    }
    
    
    pageControl.currentPage=myCurrentPage;
    self.MyScrolViewIMG.contentOffset = CGPointMake(cLocation, 0);
    
    
}




@end
