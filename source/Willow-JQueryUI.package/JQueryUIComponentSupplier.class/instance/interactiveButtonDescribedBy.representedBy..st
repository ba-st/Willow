accessing
interactiveButtonDescribedBy: aDescription representedBy: anIcon

	^ SynchronicSubmitButtonWebView
		labeled: aDescription
		applying:
			(JQueryUIButtonCommand representedBy: anIcon)
		evaluating: [  ]