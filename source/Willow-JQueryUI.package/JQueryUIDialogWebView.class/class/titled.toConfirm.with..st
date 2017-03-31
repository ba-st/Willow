instance creation
titled: aTitle toConfirm: aWebView with: anAcceptanceText

	^ self
		titled: aTitle
		containing: aWebView
		optingFor: (Optional containing: anAcceptanceText)