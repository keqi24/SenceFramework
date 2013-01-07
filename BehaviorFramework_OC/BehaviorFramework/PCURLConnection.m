//
//  PCURLConnection.m
//  AssetShow
//
//  Created by apple on 12-2-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "PCURLConnection.h"
#import "Constant.h"
#import "PCServerPackageParser.h"

const int TIMEOUTINTERVAL = 5;
const int RUNTIME = 6;

@implementation PCURLConnection 

@synthesize url = _url;
@synthesize parser = _parser;
@synthesize resultData = _resultData;
@synthesize target = _target;

#pragma mark -ConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response 
{
    //    NSHTTPURLResponse *httpResponse= (NSHTTPURLResponse*)response;
    //    if ([response respondsToSelector:@selector(allHeaderFields)])
    //    {
    //        NSDictionary __unused *dictionary= [httpResponse allHeaderFields];
    //        CCLOG(@"%@",[dictionary description]);
    //    }
    NSLog(@"didReceiveResponse !!");
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"didReceiveData");
    [_receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    
    NSLog(@"connection failed! %@ %@",[error localizedDescription], [[error userInfo] objectForKey:NSURLErrorKey]);
    
}



- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    NSLog(@"_receivedData --> %@",_receivedData);
    NSLog(@"parser ---> %@",_parser);

    NSDictionary * temp = [self.parser parse:_receivedData];
    NSlog(@"temp --> %@",temp);
    if (temp) {
//        if ([_target respondsToSelector:_selector]) {
//            id t = [_target performSelector:_selector withObject:temp];
//            _result = (ResultType) t;
//        }
//        else {
//            NSlog(@"the server doesn't exist!");
//        }
    }else {
        _result=ACTION_CONNECTIONFAILED;
    }
}

#pragma mark -init
-(id) init {
    self = [super init];
    if (self) {
        _url = nil;
        _runtime = 0;
    }
    return self;    
}


#pragma mark -startConnection

-(void)startConnect {
    
    if (_runtime >RUNTIME) {
        NSlog(@"retry too much times!");
        return;
    }
    
    NSMutableURLRequest * request = nil;
    assert(_url != nil);
    
    NSlog(@"url --> %@",_url);
    request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_url]
    cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:TIMEOUTINTERVAL];
    
    
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [request release];
    
    if (connection) {
        if (_receivedData) {
            [_receivedData release];
        }
        _receivedData = [[NSMutableData data] retain];
        [connection release];
    }else {
        NSlog(@"connection fail!");
    }
    _runtime ++;
}

-(void)setUrl:(NSString *)url target:(id)target selector:(SEL)selector parser:(id<PCParserProtocol>)parser {
//    NSAssert(YES, @"fobid the sertUrl target selector parser method", nil);
    self.url = url;
    self.target = target;
    _selector = selector;
    self.parser = parser;
}


- (void)dealloc {
    [_url release];
    [_receivedData release];
    [_parser release];
    if (_target) {
        [_target release];
    }
    [super dealloc];
}
@end
