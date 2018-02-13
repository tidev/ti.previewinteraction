/**
 * Ti.previewinteraction
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#if IS_IOS_10

#import "TiPreviewinteractionPreviewInteractionProxy.h"
#import "TiViewProxy+PreviewInteraction.h"

@implementation TiViewProxy (PreviewInteraction)

- (void)setPreviewInteraction:(id)preview
{
  ENSURE_TYPE(preview, TiPreviewinteractionPreviewInteractionProxy);
  [((TiPreviewinteractionPreviewInteractionProxy *)preview) setSourceView:self];
}

@end

#endif
