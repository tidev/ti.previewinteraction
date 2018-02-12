/**
 * Ti.previewinteraction
 * Copyright (c) 2009-2018 by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#if IS_IOS_10

#import "TiViewProxy+PreviewInteraction.h"
#import "TiPreviewinteractionPreviewInteractionProxy.h"

@implementation TiViewProxy (PreviewInteraction)

- (void)setPreviewInteraction:(id)preview
{
  ENSURE_TYPE(preview, TiPreviewinteractionPreviewInteractionProxy);
  [((TiPreviewinteractionPreviewInteractionProxy *)preview) setSourceView:self];
}

@end

#endif
