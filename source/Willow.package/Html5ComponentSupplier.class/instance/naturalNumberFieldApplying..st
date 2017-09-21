Supplying
naturalNumberFieldApplying: aComponentCommand

	^ NumberFieldWebView
		applying: aComponentCommand asWebComponentCommand + ComponentBoundaryCommand nonNegative
		transformingWith: NaturalNumberCodec new