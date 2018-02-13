# Ti.PreviewInteraction

Use the iOS 10+ UIPreviewInteraction API in Titanium!

## API's

### Top Level

#### Properties

##### `previewInteractionSupported` -> Boolean

Determines if the current device supports preview interactions.

### PreviewInteraction

#### Methods

##### `cancelInteraction`

Cancels the current preview interaction. When a preview interaction is in 
progress, use this method to cancel it, preventing any further callbacks.

#### Properties

##### `sourceView` (Ti.UI.View)

The view to start the preview interation from.

#### Events

##### `peek`

Fired when the user peeks the preview.

- `progress` (Float): Provides progress of peek ranging between 0.0 and 1.0. 
- `ended` (Boolean): Value indicating progress has ended or not.
- `touchPoint` (Ti.Point):  Point at which source view was touched.

##### `pop`

Fired when the user pops the preview.

- `progress` (Float): Provides progress of peek ranging between 0.0 and 1.0. 
- `ended` (Boolean): Value indicating progress has ended or not.
- `touchPoint` (Ti.Point):  Point at which source view was touched.

##### `cancel`

Fired when the preview interaction was cancelled by the user.

## Contributors

* Vijay Vikram Singh
* Hans Knöchel

Interested in contributing? Read the [contributors/committer's](https://wiki.appcelerator.org/display/community/Home) guide.

## Legal

This module is Copyright (c) 2010-present by Appcelerator, Inc. All Rights Reserved. Usage of this module is subject to 
the Terms of Service agreement with Appcelerator, Inc.  
