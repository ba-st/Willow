Supplying
naturalNumberFieldApplying: aComponentCommand

	^ NumberFieldWebView applying: ComponentBoundaryCommand nonNegative + aComponentCommand transformingWith: NaturalNumberCodec new