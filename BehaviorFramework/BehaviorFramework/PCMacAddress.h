//
//  PCMacAddress.h
//  AssetShow
//
//  Created by apple on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCMacAddress : NSObject

+(PCMacAddress *)shareMacAddress;
-(NSString *) getMacAddress;

@end
