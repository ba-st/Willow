accessing - private
borderedWidgetCssStyles

	^ OrderedCollection new
		addAll: self widgetCssStyles;
		add: JQueryCssStyles uiCornerAll;
		yourself