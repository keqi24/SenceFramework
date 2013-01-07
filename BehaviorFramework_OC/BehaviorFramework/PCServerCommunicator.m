//
//  PCServerCommunicator.m
//  AssetShow
//
//  Created by apple on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PCServerCommunicator.h"
#import "PCMacAddress.h"
#import "PCServerPackageParser.h"
#import "PCURLConnection.h"
#import "Constant.h"

@implementation PCRequestPublicPara

@synthesize selecor = _selecor;
@synthesize delegate = _delegate;
@synthesize macAddress = _macAddress;

-(id)initWithDelegate:(id)delegate selector:(SEL)selector macAddress:(NSString *)mac {
    self = [super init];
    if (self) {
        self.selecor = selector;
        self.delegate = delegate;
        self.macAddress = mac;
    }
    return self;
}

+(id) PCRequestPublicParaWithDelegate:(id)delegate selector:(SEL)selector macAddress:(NSString *)mac {
    return [[[PCRequestPublicPara alloc] initWithDelegate:delegate selector:selector macAddress:mac] autorelease];;
}

+(id) PCRequestPublicParaWithDelegate:(id)delegate selector:(SEL)selector {
    return [PCRequestPublicPara PCRequestPublicParaWithDelegate:delegate selector:selector macAddress:[[PCMacAddress shareMacAddress] getMacAddress]];
}

- (void)dealloc {
    [_delegate release];
    [_macAddress release];
    [super dealloc];
}

@end


@interface PCServerCommunicator(Private) 

@end

static PCServerCommunicator * serverCommunicator = nil;

@implementation PCServerCommunicator

@synthesize macAddress = _macAddress;

+(PCServerCommunicator *)shareServerCommnunicator  {
    return serverCommunicator == nil ? serverCommunicator = [[PCServerCommunicator alloc] init] : serverCommunicator;
}




-(void)sendEventWithRecordData:(RecordData*)record url:(NSString*)url macAddress:(NSString*) macAddress{
    
}

-(void)sendEventWithRecordData:(RecordData*)record {
    [self sendEventWithRecordData:record url:nil macAddress:nil];
}




-(void)URLConnectionInit:(PCRequestPublicPara *)publicPara parser:(id)parser url:(NSString *)url {
    PCURLConnection * connection = [[PCURLConnection alloc] init];
//    connection.parser = parser;
    [connection setUrl:url target:publicPara.delegate selector:publicPara.selecor parser:parser];
    [connection startConnect];
    [connection release];
}

-(void)getPositionInfo:(PCRequestPublicPara *)publicPara {
    PCJsonParser * parser = [[PCJsonParser alloc] init];
    NSString * url = [SERVER_URL stringByAppendingString:publicPara.macAddress];;
    [self URLConnectionInit:publicPara parser:parser url:url];
    [parser release];
}

//-(NSDictionary *)getPositionInfo {
//    PCJsonParser * parser = [[PCJsonParser alloc] init];
//    NSString * url = [POSITIONURL stringByAppendingString:_macAddress];;
//    PCURLConnection * connection = [[[PCURLConnection alloc] init] autorelease];
//    connection.parser = parser;
//    connection.url = url;
//    [connection startConnect];
//    return connection.resultData;
//}

- (id)init {
    self = [super init];
    if (self) {
        _macAddress = [[PCMacAddress shareMacAddress] getMacAddress];
    }
    return self;
}

@end
