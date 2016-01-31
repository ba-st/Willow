rendering
renderContentOn: aCanvas

	contentsView resetFieldContents.
	(aCanvas div)
		class: WillowCssStyles showScrollBarsWhenNeeded;
		script: (self dialogScriptOn: aCanvas);
		with: contentsView