//
//  ViewController.h
//  Roman Numeral Converter
//
//  Created by Feng Zhou on 3/18/13.
//  Copyright (c) 2013 Feng Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)numberHit:(UIButton *)sender;
- (IBAction)clearHit:(id)sender;
- (IBAction)delHit:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *inputLabel;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (strong,nonatomic) NSArray *roman_literals;

@end
