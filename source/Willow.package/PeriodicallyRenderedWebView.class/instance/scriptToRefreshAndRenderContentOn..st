private-rendering
scriptToRefreshAndRenderContentOn: aCanvas

	^(aCanvas jQuery id: identifiedViewToRefresh identifier)
		html: [:renderingCanvas | self refreshAndRenderContentOn: renderingCanvas]