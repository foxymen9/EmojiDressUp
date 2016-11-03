//
//  ViewController.m
//  EmojiDressUp
//
//  Created by Bendt Jensen on 29/10/16.
//  Copyright © 2016 Bendt Jensen. All rights reserved.
//

#import "MainViewController.h"
#import "Global.h"

@interface MainViewController ()
{
    NSInteger hair_status;
    NSInteger dress_status;
    NSInteger hair_btn_selected;
    NSInteger dress_btn_selected;
    
}
@property (nonatomic) NSArray *dressImageArray;
@property (nonatomic) NSArray *hairImageArray;
@property (nonatomic) NSArray *thumbDressImageArray;
@property (nonatomic) NSArray *thumbHairImageArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.`
    
    Global *global = [Global sharedInstance];
    self.dressImageArray = global.dressImageArray;
    self.hairImageArray = global.hairImageArray;
    self.thumbDressImageArray = global.thumbDressImageArray;
    self.thumbHairImageArray = global.thumbHairImageArray;
    
    [self initControls];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initControls {
    hair_status = 0;
    dress_status = 0;
    hair_btn_selected = 0;
    dress_btn_selected = 0;
    [self.btnDress1 setImage:[self.thumbDressImageArray objectAtIndex:0]  forState:UIControlStateNormal];
    [self.btnDress2 setImage:[self.thumbDressImageArray objectAtIndex:1]  forState:UIControlStateNormal];
    [self.btnDress3 setImage:[self.thumbDressImageArray objectAtIndex:2]  forState:UIControlStateNormal];
    [self.btnHair1 setImage:[self.thumbHairImageArray objectAtIndex:0]  forState:UIControlStateNormal];
    [self.btnHair2 setImage:[self.thumbHairImageArray objectAtIndex:1]  forState:UIControlStateNormal];
    [self.btnHair3 setImage:[self.thumbHairImageArray objectAtIndex:2]  forState:UIControlStateNormal];
    [self updateButtons];
}

-(void)captureAndCopyToClipboard{

    //Capture
    UIGraphicsBeginImageContext(self.captureView.bounds.size);
    [self.captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    //Copy To Clipboard
    [UIPasteboard generalPasteboard].image = capturedImage;
}


- (IBAction)onBtnPrevDress:(id)sender {
    if (dress_status > 0)
        dress_status--;
    if (dress_btn_selected > 0)
        dress_btn_selected--;
    if (dress_btn_selected == 0)
    {
        [self.btnDress3 setImage:[self.thumbDressImageArray objectAtIndex:dress_status+2] forState:UIControlStateNormal];
        [self.btnDress2 setImage:[self.thumbDressImageArray objectAtIndex:dress_status+1] forState:UIControlStateNormal];
        [self.btnDress1 setImage:[self.thumbDressImageArray objectAtIndex:dress_status] forState:UIControlStateNormal];
    }
    [self updateButtons];
}

- (IBAction)onBtnNextDress:(id)sender {
    if (dress_status < (self.dressImageArray.count - 1))
        dress_status++;
    if (dress_btn_selected < 2)
        dress_btn_selected++;
    if (dress_btn_selected == 2)
    {
        [self.btnDress3 setImage:[self.thumbDressImageArray objectAtIndex:dress_status] forState:UIControlStateNormal];
        [self.btnDress2 setImage:[self.thumbDressImageArray objectAtIndex:dress_status-1] forState:UIControlStateNormal];
        [self.btnDress1 setImage:[self.thumbDressImageArray objectAtIndex:dress_status-2] forState:UIControlStateNormal];
    }
    [self updateButtons];
}

- (IBAction)onBtnDress1:(id)sender {
    dress_status = dress_status - (dress_btn_selected - 0);
    dress_btn_selected = 0;
    [self updateButtons];
}

- (IBAction)onBtnDress2:(id)sender {
    dress_status = dress_status - (dress_btn_selected - 1);
    dress_btn_selected = 1;
    [self updateButtons];
}

- (IBAction)onBtnDress3:(id)sender {
    dress_status = dress_status - (dress_btn_selected - 2);
    dress_btn_selected = 2;
    [self updateButtons];
}

- (IBAction)onBtnPrevHair:(id)sender {
    if (hair_status > 0)
        hair_status--;
    if (hair_btn_selected > 0)
        hair_btn_selected--;
    if (hair_btn_selected == 0)
    {
        [self.btnHair3 setImage:[self.thumbHairImageArray objectAtIndex:hair_status+2] forState:UIControlStateNormal];
        [self.btnHair2 setImage:[self.thumbHairImageArray objectAtIndex:hair_status+1] forState:UIControlStateNormal];
        [self.btnHair1 setImage:[self.thumbHairImageArray objectAtIndex:hair_status] forState:UIControlStateNormal];
    }
    [self updateButtons];
}

- (IBAction)onBtnNextHair:(id)sender {
    if (hair_status < (self.hairImageArray.count - 1))
        hair_status++;
    if (hair_btn_selected < 2)
        hair_btn_selected++;
    if (hair_btn_selected == 2)
    {
        [self.btnHair3 setImage:[self.thumbHairImageArray objectAtIndex:hair_status] forState:UIControlStateNormal];
        [self.btnHair2 setImage:[self.thumbHairImageArray objectAtIndex:hair_status-1] forState:UIControlStateNormal];
        [self.btnHair1 setImage:[self.thumbHairImageArray objectAtIndex:hair_status-2] forState:UIControlStateNormal];
    }
    [self updateButtons];
}

- (IBAction)onBtnHair1:(id)sender {
    hair_status = hair_status - (hair_btn_selected - 0);
    hair_btn_selected = 0;
    [self updateButtons];
}

- (IBAction)onBtnHair2:(id)sender {
    hair_status = hair_status - (hair_btn_selected - 1);
    hair_btn_selected = 1;
    [self updateButtons];
}

- (IBAction)onBtnHair3:(id)sender {
    hair_status = hair_status - (hair_btn_selected - 2);
    hair_btn_selected = 2;
    [self updateButtons];
}

- (IBAction)onBtnMenu:(id)sender {
}

- (IBAction)onBtnSMS:(id)sender {
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
	if([MFMessageComposeViewController canSendText])
	{
		controller.body = @"";
		controller.recipients = [NSArray arrayWithObjects:@"", nil];
		controller.messageComposeDelegate = self;
        [self presentModalViewController:controller animated:YES];
	}

}
- (void)messageComposeViewController:
(MFMessageComposeViewController *)controller
                 didFinishWithResult:(MessageComposeResult)result 
{
    switch (result)
    {
        case MessageComposeResultCancelled:  
            NSLog(@"Cancelled");    
            break; 
        case MessageComposeResultFailed:
            NSLog(@"Failed");
            break;   
        case MessageComposeResultSent:      
            break; 
        default:  
            break;  
    }  
    [self dismissModalViewControllerAnimated:YES]; 
}

- (void)updateButtons {
    if (dress_btn_selected == 0)
    {
        [self.btnDress1 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnDress2 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnDress3 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    else if (dress_btn_selected == 1)
    {
        [self.btnDress2 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnDress1 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnDress3 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    else if (dress_btn_selected == 2)
    {
        [self.btnDress3 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnDress1 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnDress2 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    if (hair_btn_selected == 0)
    {
        [self.btnHair1 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnHair2 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnHair3 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    else if (hair_btn_selected == 1)
    {
        [self.btnHair2 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnHair1 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnHair3 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    else if (hair_btn_selected == 2)
    {
        [self.btnHair3 setBackgroundImage:[UIImage imageNamed:@"selected_outline"] forState:UIControlStateNormal];
        [self.btnHair1 setBackgroundImage:NULL forState:UIControlStateNormal];
        [self.btnHair2 setBackgroundImage:NULL forState:UIControlStateNormal];
        
    }
    
    [self.imgHair setImage:[self.hairImageArray objectAtIndex:hair_status]];
    [self.imgClothes setImage:[self.dressImageArray objectAtIndex:dress_status]];
    
    //Capture And Copy to clipboard
    [self captureAndCopyToClipboard];
}
@end
