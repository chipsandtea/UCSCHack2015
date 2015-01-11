//
//  HackData.m
//  HackUCSC2015
//
//  Created by Arjun Gopisetty on 1/10/15.
//  Copyright (c) 2015 HackUCSC2015Team. All rights reserved.
//

#import "HackData.h"

NSMutableDictionary* gHackData;         // singleton instance

NSMutableDictionary* sharedData() {
    if (!gHackData) {
        gHackData = [NSMutableDictionary dictionaryWithCapacity:1];
    }
    return gHackData;
}
