//
//  PCServerPackageParser.h
//  AssetShow
//
//  Created by apple on 12-2-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PCParserProtocol <NSObject>
-(id)parse:(NSData *) receivedData;
@end


@interface PCJsonParser : NSObject<PCParserProtocol>
@end

