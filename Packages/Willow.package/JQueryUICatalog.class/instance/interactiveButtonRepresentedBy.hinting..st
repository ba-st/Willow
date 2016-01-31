accessing
interactiveButtonRepresentedBy: anIcon hinting: aText

	^ SimpleTextWebView
		emptyTitled: aText
		styledAccordingToAll: (Array with: anIcon with: ERABasicCssStyles buttonSmall)