instance creation - private
obtainingContentFrom: aContentProvider applying: aCommandCollection

	self
		deprecated: 'Use PhrasingContainerWebView'
		transformWith:
			'SimpleTextWebView obtainingContentFrom: `@aContentProvider applying: `@aCommandCollection'
				-> ' PhrasingContainerWebView obtainingContentFrom: `@aContentProvider applying: (CompositeComponentCommand applyingAll: `@aCommandCollection)'.
	^ PhrasingContainerWebView obtainingContentFrom: aContentProvider applying: (CompositeComponentCommand applyingAll: aCommandCollection)