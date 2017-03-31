accessing - private
dialogScriptOn: aCanvas

	| dialog |

	dialog := aCanvas jQuery new dialog.
	self addAcceptButtonTo: dialog on: aCanvas.
	dialog
		onClose: (self functionToRemoveComponentOn: aCanvas);
		height: 'auto';
		width: 'auto';
		title: title;
		autoOpen: true;
		resizable: false;
		closeOnEscape: true.
	^ dialog