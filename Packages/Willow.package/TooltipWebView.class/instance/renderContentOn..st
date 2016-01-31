rendering
renderContentOn: aCanvas

	contentsView resetFieldContents.
	(aCanvas div)
		class: WillowCssStyles tooltipContainer;
		script: (self dialogScriptOn: aCanvas);
		with: contentsView