//
//  PCURLConnection.h
//  AssetShow
//
//  Created by apple on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PCParserProtocol;


typedef enum _ResultType{
    ACTION_SUCCESS=0,
    ACTION_FAILED,
    ACTION_CHEATING,
    ACTION_TIMECHECKFAILED,
    ACTION_CONNECTIONFAILED
}ResultType;

@interface PCURLConnection : NSObject {
    NSMutableData* _receivedData;
    NSString* _url;
    int _runtime;
    id _target;
    SEL _selector;
    ResultType _result;
    id<PCParserProtocol> _parser;
}

@property(readwrite,retain,nonatomic) NSString * url;
@property(readwrite,retain,nonatomic) id<PCParserProtocol> parser;
@property(readonly,retain,nonatomic) id resultData;
@property(readwrite,retain,nonatomic) id target;

-(void)startConnect;
-(void)setUrl:(NSString *)url target:(id)target selector:(SEL)selector parser:(id<PCParserProtocol>)parser; 



@end
