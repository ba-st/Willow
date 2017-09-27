Supplying
naturalNumberFieldApplying: aComponentCommand

	^ NumberFieldWebView applying: [ :field | field boundNotNegative + aComponentCommand ] transformingWith: NaturalNumberCodec new