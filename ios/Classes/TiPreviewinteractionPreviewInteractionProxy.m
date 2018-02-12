/**
 * Ti.previewinteraction
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#if IS_IOS_10

#import "TiPreviewinteractionPreviewInteractionProxy.h"
#import "TiViewProxy.h"
#import "TiPoint.h"
#import "TiBase.h"

@implementation TiPreviewinteractionPreviewInteractionProxy

#pragma mark Internal

- (void)_initWithProperties:(NSDictionary *)properties
{
  if (![TiUtils forceTouchSupported] || ![TiUtils isIOS10OrGreater]) {
    NSLog(@"[WARN] Preview Interaction is not available on this device.");
    return;
  }
  
  [super _initWithProperties:properties];
}

- (void)setSourceView:(TiViewProxy *)sourceViewProxy
{
  if (previewInteraction) {
    NSLog(@"[WARN] Preview interaction is already created.");
    return;
  }
  previewInteraction = [[UIPreviewInteraction alloc] initWithView:[sourceViewProxy view]];
  [previewInteraction setDelegate:self];
}

#pragma mark UIPreviewInteractionDelegate methods

- (BOOL)previewInteractionShouldBegin:(UIPreviewInteraction *)previewInteraction
{
  return true;
}

- (void)previewInteraction:(UIPreviewInteraction *)previewInteraction didUpdatePreviewTransition:(CGFloat)transitionProgress ended:(BOOL)ended
{
  CGPoint point = [previewInteraction locationInCoordinateSpace:previewInteraction.view];
  TiPoint *touchPoint = [[TiPoint alloc] initWithPoint:point];
  NSDictionary *event = @{@"progress" : NUMFLOAT(transitionProgress),
                          @"ended" : NUMBOOL(ended),
                          @"touchPoint" : touchPoint
                          };
  if ([self _hasListeners:@"peek"]) {
    TiThreadPerformOnMainThread(^{
      [self fireEvent:@"peek" withObject:event];
    }, NO);
  }
}

- (void)previewInteraction:(UIPreviewInteraction *)previewInteraction didUpdateCommitTransition:(CGFloat)transitionProgress ended:(BOOL)ended
{
  CGPoint point = [previewInteraction locationInCoordinateSpace:previewInteraction.view];
  TiPoint *touchPoint = [[TiPoint alloc] initWithPoint:point];
  NSDictionary *event = @{@"progress" : NUMFLOAT(transitionProgress),
                          @"ended" : NUMBOOL(ended),
                          @"touchPoint" : touchPoint
                          };
  if ([self _hasListeners:@"pop"]) {
    TiThreadPerformOnMainThread(^{
      [self fireEvent:@"pop" withObject:event];
    }, NO);
  }
}

- (void)previewInteractionDidCancel:(UIPreviewInteraction *)previewInteraction
{
  if ([self _hasListeners:@"cancel"]) {
    [self fireEvent:@"cancel" withObject:nil];
  }
}

#pragma mark Public API's

- (void)cancelInteraction:(id)unused
{
  [previewInteraction cancelInteraction];
}

@end

#endif
