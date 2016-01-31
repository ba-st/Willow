initialize-release
initialize

	super initialize.
	self obtainContentsFrom: [#()].
	identifier := ''.
	interactionInterpreter := WebInteractionInterpreter
				forChangeInComponentValue.
	cssStyleNames := OrderedCollection new