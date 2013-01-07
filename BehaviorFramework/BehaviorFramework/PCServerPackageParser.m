//
//  PCServerPackageParser.m
//  AssetShow
//
//  Created by apple on 12-2-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PCServerPackageParser.h"



@implementation PCJsonParser

-(id)parse:(NSData *)receivedData {
    NSError * error = nil;
    NSlog(@"parserData --> %@",receivedData);
    NSDictionary* json = [NSJSONSerialization JSONObjectWithData:receivedData //1   
                                                         options:kNilOptions 
                                                           error:&error];
//    NSDictionary * json = [[CJSONDeserializer deserializer] deserializeAsDictionary:receivedData error:&error ];
//    if (error) {
//        NSlog(@"received json:%@",json.description);
//        NSlog(@"JSON create error :%@",[error domain]);
//        
//        return nil;
//    }
    NSlog(@"JSON create error :%@",[error domain]);
    NSlog(@"received json:%@",json.description);
    return json;
}

-(id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end


