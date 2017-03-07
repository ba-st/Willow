instance creation
between: aMinimum and: aMaximum

	self
		deprecated: 'Use NumberFieldWebView'
		transformWith: 'NumberWebView between: ̀@aMinimum and: ̀@aMaximum' -> 'NumberFieldWebView forIntegersBetween: ̀@aMinimum and: ̀@aMaximum'.
	^ NumberFieldWebView forIntegersBetween: aMinimum and: aMaximum