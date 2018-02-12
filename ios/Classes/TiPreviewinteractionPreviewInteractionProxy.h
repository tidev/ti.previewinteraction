/**
 * Ti.previewinteraction
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#if IS_IOS_10

#import "TiProxy.h"
#import "TiViewProxy.h"

@interface TiPreviewinteractionPreviewInteractionProxy : TiProxy<UIPreviewInteractionDelegate>
{
@private
  UIPreviewInteraction *previewInteraction;
}

- (void)setSourceView:(TiViewProxy *)sourceViewProxy;
- (void)cancelInteraction:(id)unused;

@end

#endif
