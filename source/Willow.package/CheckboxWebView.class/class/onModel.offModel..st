instance creation
onModel: anObjectToUseWhenOn offModel: anObjectToUseWhenOff

	^ self
		onModel: anObjectToUseWhenOn
		offModel: anObjectToUseWhenOff
		applying: CompositeComponentCommand empty