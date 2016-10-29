//
//  ViewController.h
//  EmojiDressUp
//
//  Created by Bendt Jensen on 29/10/16.
//  Copyright © 2016 Bendt Jensen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnPrevDress;
@property (weak, nonatomic) IBOutlet UIButton *btnNextDress;
@property (weak, nonatomic) IBOutlet UIButton *btnDress1;
@property (weak, nonatomic) IBOutlet UIButton *btnDress2;
@property (weak, nonatomic) IBOutlet UIButton *btnDress3;
@property (weak, nonatomic) IBOutlet UIButton *btnPrevHair;
@property (weak, nonatomic) IBOutlet UIButton *btnNextHair;
@property (weak, nonatomic) IBOutlet UIButton *btnHair1;
@property (weak, nonatomic) IBOutlet UIButton *btnHair2;
@property (weak, nonatomic) IBOutlet UIButton *btnHair3;

- (IBAction)onBtnPrevDress:(id)sender;
- (IBAction)onBtnNextDress:(id)sender;
- (IBAction)onBtnDress1:(id)sender;
- (IBAction)onBtnDress2:(id)sender;
- (IBAction)onBtnDress3:(id)sender;
- (IBAction)onBtnPrevHair:(id)sender;
- (IBAction)onBtnNextHair:(id)sender;
- (IBAction)onBtnHair1:(id)sender;
- (IBAction)onBtnHair2:(id)sender;
- (IBAction)onBtnHair3:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imgCharacter;
@property (weak, nonatomic) IBOutlet UIImageView *imgClothes;
@property (weak, nonatomic) IBOutlet UIImageView *imgHair;

@end

