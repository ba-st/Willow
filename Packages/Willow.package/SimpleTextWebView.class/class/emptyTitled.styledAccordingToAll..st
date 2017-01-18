instance creation
emptyTitled: aTitle styledAccordingToAll: aCssStyleCollection

	self
		deprecated: 'Please use PhrasingContainerWebView'
		transformWith:
			'SimpleTextWebView emptyTitled: `@aTitle styledAccordingToAll: `@aCssStyle'
				->
					'PhrasingContainerWebView
		obtainingContentFrom: [  ]
		applying:
			(CompositeComponentCommand
				applyingAll:
					{(ComponentTitleCommand toSet: `@aTitle).
					(ComponentClassificationCommand toStyleWithAll: `@aCssStyle)})'.
	^ PhrasingContainerWebView
		obtainingContentFrom: [  ]
		applying:
			(CompositeComponentCommand
				applyingAll:
					{(ComponentTitleCommand toSet: aTitle).
					(ComponentClassificationCommand toStyleWithAll: aCssStyleCollection)})