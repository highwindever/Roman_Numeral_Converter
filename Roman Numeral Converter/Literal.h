//
//  Literal.h
//  Roman Numeral Converter
//
//  Created by Feng Zhou on 3/18/13.
//  Copyright (c) 2013 Feng Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Literal : NSObject
@property char literal;
@property int intValue;
-(id)initWithLiteral:(char)literal intValue:(int) intValue;
-(id)init;
@end
