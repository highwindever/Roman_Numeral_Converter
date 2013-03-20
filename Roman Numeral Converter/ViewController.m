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
    self.inputLabel.text = @"Press letter to input";
    self.resultLabel.text = @"Result will show here";
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
    if([self.inputLabel.text isEqualToString:@"Press letter to input"]){
        self.inputLabel.text = @"";
    }
    
    NSString *number =[sender currentTitle];
    self.inputLabel.text =[self.inputLabel.text stringByAppendingString:number];
    
    if([self isValidRomanNumeral:self.inputLabel.text]){
        int num = [self convertNumber:self.inputLabel.text];
        if(num==0) {
            self.inputLabel.text =@"Press letter to input";
            self.resultLabel.text=@"Result will show here";
        }
        else self.resultLabel.text = [NSString stringWithFormat:@"%d",num];
    }else self.resultLabel.text = @"Input is not valid";
        
    
    
}

- (IBAction)clearHit:(id)sender {
    self.inputLabel.text =@"Press letter to input";
    self.resultLabel.text=@"Result will show here";
}

- (IBAction)delHit:(id)sender {
    NSString *str =self.inputLabel.text;
    if (![str isEqualToString:@"Press letter to input"] ) {
        self.inputLabel.text = [str substringToIndex:[str length] - 1];
        if([self isValidRomanNumeral:self.inputLabel.text]){
            int num = [self convertNumber:self.inputLabel.text];
            if(num==0) {
                self.inputLabel.text =@"Press letter to input";
                self.resultLabel.text=@"Result will show here";
            }
            else self.resultLabel.text = [NSString stringWithFormat:@"%d",num];
        }else self.resultLabel.text = @"Input is not valid";    
    }
    
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

-(BOOL) isValidRomanNumeral:(NSString *) roman {
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$'"];
    BOOL result = [predicate evaluateWithObject:roman];
    return result;
}


@end
