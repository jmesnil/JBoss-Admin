//
//  JBAManagementModelNode.m
//  JBoss Admin
//
//  Author: Christos Vasilakis <cvasilak@gmail.com>
//  Copyright 2012 All rights reserved.
//

#import "JBAManagementModel.h"

@implementation JBAManagementModel

@synthesize name;
@synthesize descr;
@synthesize type;
@synthesize valueType;

-(void)dealloc {
    DLog(@"JBAManagementModel dealloc");    
}

- (NSString  *) typeAsString {
    return [JBAManagementModel stringFromType:self.type];
}

- (NSString  *) valueTypeAsString {
    return [JBAManagementModel stringFromType:self.valueType];
}

+ (NSString  *) stringFromType:(JBAType) type {
    switch (type) {
        case STRING:
            return @"String";
            break;
        case INT:
            return @"Int";
            break;
        case LONG:            
            return @"Long";
            break;
        case BIG_DECIMAL:
            return @"Big Decimal";
            break;
        case BIG_INTEGER:
            return @"Big Integer";
            break;
        case DOUBLE:
            return @"Double";
            break;
        case BOOLEAN:
            return @"Boolean";
            break;
        case PROPERTY:
            return @"Property";
            break;            
        case OBJECT:
            return @"Object";
            break;
        case BYTES:
            return @"Bytes";
            break;
        case LIST:
            return @"List";
            break;
        default:
            return nil;
    }
}

+ (JBAType) typeFromString:(NSString *)type {
    if ([type isEqualToString:@"STRING"])
        return STRING;
    else if ([type isEqualToString:@"INT"]) 
        return INT;
    else if ([type isEqualToString:@"LONG"])
        return LONG;
    else if ([type isEqualToString:@"BIG_DECIMAL"])
        return BIG_DECIMAL;
    else if ([type isEqualToString:@"BIG_INTEGER"])
        return BIG_INTEGER;
    else if ([type isEqualToString:@"DOUBLE"])
        return DOUBLE;
    else if ([type isEqualToString:@"BOOLEAN"])
        return BOOLEAN;
    else if ([type isEqualToString:@"PROPERTY"])
        return PROPERTY;
    else if ([type isEqualToString:@"OBJECT"])
        return OBJECT;
    else if ([type isEqualToString:@"BYTES"])
        return BYTES;
    else if ([type isEqualToString:@"LIST"])
        return LIST;
    
    return UNDEFINED;
}

// sort by name
- (NSComparisonResult)compare:(JBAAttribute *)otherObject {
    return [self.name compare:otherObject.name];
}

@end

@implementation JBAAttribute

@synthesize path;
@synthesize value;
@synthesize isReadOnly;

@end

@implementation JBAChildType

@synthesize value;

@end


@implementation JBAOperationParameter

@synthesize nillable;
@synthesize required;
@synthesize value;
@synthesize defaultValue;
@synthesize isAddParameter;

// sort by name
- (NSComparisonResult)compare:(JBAAttribute *)otherObject {
    return [self.name compare:otherObject.name];
}

// sort by required parameter
- (NSComparisonResult)compareRequired:(JBAOperationParameter *)otherObject {
    if (self.required && !otherObject.required)
        return (NSComparisonResult)NSOrderedAscending;
    else if (!self.required && otherObject.required)
        return (NSComparisonResult)NSOrderedDescending;
    
    return (NSComparisonResult)NSOrderedSame;
}

@end

@implementation JBAOperationReply 

@end

@implementation JBAOperation

@synthesize path;
@synthesize parameters;
@synthesize reply;
@synthesize isReadOnly;

@end

