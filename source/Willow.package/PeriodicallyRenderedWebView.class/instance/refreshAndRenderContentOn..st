private-rendering
refreshAndRenderContentOn: aCanvas

	refreshCommand value.
	aCanvas render: identifiedViewToRefresh view.

	stopRenderingContent := true.
	aCanvas document addLoadScript: (aCanvas jQuery ajax callback: [stopRenderingContent := false])