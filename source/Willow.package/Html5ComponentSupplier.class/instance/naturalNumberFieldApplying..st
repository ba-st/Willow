Supplying
naturalNumberFieldApplying: aComponentCommand

	^NumberFieldWebView
		applying: aComponentCommand + ComponentBoundaryCommand nonNegative
		transformingWith: NaturalNumberCodec new