//
//  ViewController.m
//  Roman Numeral Converter
//
//  Created by Feng Zhou on 3/18/13.
//  Copyright (c) 2013 Feng Zhou. All rights reserved.
//

#import "ViewController.h"
#import "Literal.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    Literal *l0 = [[Literal alloc] initWithLiteral:'I' intValue:1];
    Literal *l1 = [[Literal alloc] initWithLiteral:'V' intValue:5];
    Literal *l2 = [[Literal alloc] initWithLiteral:'X' intValue:10];
    Literal *l3 = [[Literal alloc] initWithLiteral:'L' intValue:50];
    Literal *l4 = [[Literal alloc] initWithLiteral:'C' intValue:100];
    Literal *l5 = [[Literal alloc] initWithLiteral:'D' intValue:500];
    Literal *l6 = [[Literal alloc] initWithLiteral:'M' intValue:1000];

    self.roman_literals = [NSArray arrayWithObjects:l0,l1,l2,l3,l4,l5,l6, nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (IBAction)numberHit:(id)sender {
    NSString *number =[sender currentTitle];
    
    self.inputLabel.text =[self.inputLabel.text stringByAppendingString:number];
    int num = [self convertNumber:self.inputLabel.text];
    if(num==0) self.resultLabel.text =@"";
    else self.resultLabel.text = [NSString stringWithFormat:@"%d",num];

    
}

- (IBAction)clearHit:(id)sender {
    self.inputLabel.text =@"";
    self.resultLabel.text=@"";
}

- (IBAction)delHit:(id)sender {
    NSString *str =self.inputLabel.text;
    self.inputLabel.text = [str substringToIndex:[str length] - 1];
    int num = [self convertNumber:self.inputLabel.text];
    if(num==0) self.resultLabel.text =@"";
    else self.resultLabel.text = [NSString stringWithFormat:@"%d",num];
}



-(int) convertNumber:(NSString *)roman{
    int decimal = 0;
    int lastPosition = 0;
    for(int i=roman.length-1;i>=0;i--){
        char c= [roman characterAtIndex:i];
        int j=0;
        for(j=0;j<[self.roman_literals count];j++){
            
            if(c==[[self.roman_literals objectAtIndex:j] literal] )
                break;
        }
        
        if(j>=lastPosition){
            decimal +=[[self.roman_literals objectAtIndex:j] intValue];
            lastPosition = j;
        }else {
            decimal -= [[self.roman_literals objectAtIndex:j] intValue];
        }
    }
    return decimal;
        
}


@end
