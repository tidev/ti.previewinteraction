/**
 * Ti.previewinteraction
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiPreviewinteractionModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiPreviewinteractionModule

#pragma mark Internal

- (id)moduleGUID
{
  return @"c30618f8-2710-40b2-b649-d5bd77176adb";
}

- (NSString *)moduleId
{
  return @"ti.previewinteraction";
}

#pragma mark Lifecycle

- (void)startup
{
  [super startup];
  DebugLog(@"[DEBUG] %@ loaded", self);
}

#pragma Public APIs

- (BOOL)previewInteractionSupported
{
  return ([TiUtils isIOS10OrGreater] && [TiUtils forceTouchSupported]);
}

@end
