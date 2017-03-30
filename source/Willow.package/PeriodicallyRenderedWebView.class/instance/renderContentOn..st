rendering
renderContentOn: aCanvas

	self refreshAndRenderOn: aCanvas.

	aCanvas
		every: refreshIntervalInMilliseconds
		millisecondsEvaluateAsAjaxScript: [:scriptCanvas |
			self scriptToRefreshAndRenderContentOn: scriptCanvas]
		until: [stopRenderingContent]