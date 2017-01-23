accessing
interactiveButtonDescribedBy: aDescription applying: aCommandToComponentCollection

	^ SynchronicSubmitButtonWebView
		labeled: aDescription
		applying:
			(CompositeComponentCommand applyingAll: aCommandToComponentCollection)
		evaluating: [  ]