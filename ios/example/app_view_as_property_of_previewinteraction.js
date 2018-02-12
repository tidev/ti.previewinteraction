
var TiPreviewInteraction = require('ti.previewinteraction');
 
var win = Ti.UI.createWindow({
    backgroundColor: 'red'
});

var previewInteraction = TiPreviewInteraction.createPreviewInteraction({
                           sourceView : view
});

var view = Ti.UI.createView({
			backgroundColor : 'blue',
			height: 200,
			width : 200,
});

previewInteraction.addEventListener('peek', function(e) {
	 Ti.API.info(e.progress);
	 Ti.API.info(e.ended);
	 Ti.API.info(e.touchPoint.x);
	 Ti.API.info(e.touchPoint.y);
 
	 if (e.progress > .8) {
	 	previewInteraction.cancelInteraction();
	 }
});
 
previewInteraction.addEventListener('pop', function(e) {
	 Ti.API.info(e.progress);
	 Ti.API.info(e.ended);
	 Ti.API.info(e.touchPoint.x);
	 Ti.API.info(e.touchPoint.y);
});
 
previewInteraction.addEventListener('cancel', function(e) {
	 Ti.API.info('Cancelled');
});
 
win.add(view);
win.open();
