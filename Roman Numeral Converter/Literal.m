//
//  Literal.m
//  Roman Numeral Converter
//
//  Created by Feng Zhou on 3/18/13.
//  Copyright (c) 2013 Feng Zhou. All rights reserved.
//

#import "Literal.h"

@implementation Literal

-(id)initWithLiteral:(char)literal intValue:(int) intValue
{
    self =[super init];
    [self setLiteral:literal];
    [self setIntValue:intValue];
    return self;
    
}

-(id)init
{
    return [self initWithLiteral:'I' intValue:1];
}

@end

