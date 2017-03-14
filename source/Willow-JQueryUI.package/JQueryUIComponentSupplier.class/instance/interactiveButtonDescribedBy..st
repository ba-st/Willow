accessing
interactiveButtonDescribedBy: aString

	^ SynchronicSubmitButtonWebView
		labeled: aString
		applying:
			(JQueryUIButtonCommand describedBy: aString)
		evaluating: [  ]