instance creation
applying: aComponentCommand

	self
		deprecated: 'Use NumberFieldWebView'
		transformWith: 'NumberWebView applying: ̀@aComponentCommand' -> 'NumberFieldWebView forIntegersApplying: ̀@aComponentCommand'.
	^ NumberFieldWebView forIntegersApplying: aComponentCommand