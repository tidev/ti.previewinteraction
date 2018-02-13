/**
 * Ti.previewinteraction
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#if IS_IOS_10

#import "TiPreviewinteractionPreviewInteractionProxy.h"
#import "TiBase.h"
#import "TiPoint.h"
#import "TiViewProxy.h"

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
  if (_previewInteraction) {
    NSLog(@"[WARN] Preview interaction is already created.");
    return;
  }
  _previewInteraction = [[UIPreviewInteraction alloc] initWithView:[sourceViewProxy view]];
  [_previewInteraction setDelegate:self];
}

#pragma mark UIPreviewInteractionDelegate

- (BOOL)previewInteractionShouldBegin:(UIPreviewInteraction *)previewInteraction
{
  return YES;
}

- (void)previewInteraction:(UIPreviewInteraction *)previewInteraction didUpdatePreviewTransition:(CGFloat)transitionProgress ended:(BOOL)ended
{
  CGPoint point = [previewInteraction locationInCoordinateSpace:previewInteraction.view];
  TiPoint *touchPoint = [[TiPoint alloc] initWithPoint:point];
  NSDictionary *event = @{
    @"progress" : @(transitionProgress),
    @"ended" : @(ended),
    @"touchPoint" : touchPoint
  };

  if ([self _hasListeners:@"peek"]) {
    TiThreadPerformOnMainThread(^{
      [self fireEvent:@"peek" withObject:event];
    },
        NO);
  }
}

- (void)previewInteraction:(UIPreviewInteraction *)previewInteraction didUpdateCommitTransition:(CGFloat)transitionProgress ended:(BOOL)ended
{
  CGPoint point = [previewInteraction locationInCoordinateSpace:previewInteraction.view];
  TiPoint *touchPoint = [[TiPoint alloc] initWithPoint:point];
  NSDictionary *event = @{
    @"progress" : @(transitionProgress),
    @"ended" : @(ended),
    @"touchPoint" : touchPoint
  };

  if ([self _hasListeners:@"pop"]) {
    TiThreadPerformOnMainThread(^{
      [self fireEvent:@"pop" withObject:event];
    },
        NO);
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
  [_previewInteraction cancelInteraction];
}

@end

#endif
