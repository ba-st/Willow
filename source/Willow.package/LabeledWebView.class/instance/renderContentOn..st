rendering
renderContentOn: aCanvas

	| label fieldIdentifier |

	fieldIdentifier := fieldWebView identifyIn: aCanvas.
	label := aCanvas label for: fieldIdentifier.
	commandToComponent applyTo: label on: aCanvas.
	label with: self phrasingContent.
	aCanvas render: self fieldWebView.
