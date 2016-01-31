accessing - private
dialogScriptOn: aCanvas

	^(aCanvas jQuery new dialog)
		onClose: aCanvas jQuery this remove;
		dialogClass: CssStyles tooltip;
		height: 'auto';
		width: 'auto';
		title: title;
		autoOpen: true;
		resizable: false;
		closeOnEscape: true