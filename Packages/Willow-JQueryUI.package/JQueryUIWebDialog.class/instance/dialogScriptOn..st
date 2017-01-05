accessing - private
dialogScriptOn: aCanvas

	| dialog |
	dialog := aCanvas jQuery new dialog.
	interactionInterpreter applyTo: dialog on: aCanvas.
	dialog
		onClose: aCanvas jQuery this remove;
		height: 'auto';
		width: 'auto';
		title: title;
		autoOpen: true;
		resizable: false;
		closeOnEscape: true.
	^dialog