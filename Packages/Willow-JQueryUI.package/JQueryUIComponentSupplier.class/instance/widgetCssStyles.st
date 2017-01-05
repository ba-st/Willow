accessing - private
widgetCssStyles

	^ OrderedCollection new
		add: JQueryCssStyles uiWidget;
		add: JQueryCssStyles uiWidgetContent;
		yourself