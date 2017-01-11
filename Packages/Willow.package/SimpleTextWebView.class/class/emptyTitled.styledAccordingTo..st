instance creation
emptyTitled: aTitle styledAccordingTo: aCssStyle

	self
		deprecated: 'Please use PhrasingContainerWebView'
		transformWith:
			'SimpleTextWebView emptyTitled: `@aTitle styledAccordingTo: `@aCssStyle'
				->
					'PhrasingContainerWebView
		obtainingContentFrom: [  ]
		applying:
			(CompositeComponentCommand
				applyingAll:
					{(ComponentTitleCommand toSet: `@aTitle).
					(ComponentClassificationCommand toStyleWith: `@aCssStyle)})'.
	^ PhrasingContainerWebView
		obtainingContentFrom: [  ]
		applying:
			(CompositeComponentCommand
				applyingAll:
					{(ComponentTitleCommand toSet: aTitle).
					(ComponentClassificationCommand toStyleWith: aCssStyle)})