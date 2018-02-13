# Ti.PreviewInteraction

This module provides a custom user experience in response to 3D Touch interactions. 

## UIPreviewInteraction Resources
  * [Apple Docs](https://developer.apple.com/documentation/uikit/uipreviewinteraction)

## Requirements
    
  * iOS 10 and later
  * 3D-Touch supported devices
  
## Getting Started
  * View the [Using Titanium Modules](http://docs.appcelerator.com/titanium/latest/#!/guide/Using_Titanium_Modules) 
    document for instructions on getting started with using this module in your application.

## Accessing the Module
  * Use `require` to access this module from JavaScript, the `TiPreviewInteraction` variable is a reference 
    to the Module object.:
```js
var TiPreviewInteraction = require('ti.previewinteraction');
```
  * iOS example applications are located in the `ios/example/` folder of the module

## Notes
  * If you want to provide the system default previewing behavior (peek and pop), use [Ti.UI.iOS.PreviewContext](docs.appcelerator.com/platform/latest/#!/api/Titanium.UI.iOS.PreviewContext). 
  * This feature requires iOS 10+ and a 3D-Touch capable device (such as iPhone 6S or iPhone 6S Plus).
    You cannot test this  on the iOS simulator. To check if the current device supports this feature, 
    use [`previewInteractionSupported`](https://github.com/appcelerator-modules/ti.previewinteraction#previewinteractionsupported---boolean).

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
