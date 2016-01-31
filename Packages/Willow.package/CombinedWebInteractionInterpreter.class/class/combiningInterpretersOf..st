instance creation
combiningInterpretersOf: aWebViewCollection

	^self
		combining: (aWebViewCollection collect: [:aWebView | aWebView onTrigger])