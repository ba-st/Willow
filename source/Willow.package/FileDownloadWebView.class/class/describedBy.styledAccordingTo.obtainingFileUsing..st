instance creation
describedBy: aDescription styledAccordingTo: aCssStyle obtainingFileUsing: aDocumentProvider

	self
		deprecated:
			'Use FileDownloadAnchorWebView instead. Keep in mind to adapt the CSS because now the parent span of the anchor no longer exists.'.

	^ FileDownloadAnchorWebView
		labeled: aDescription
		applying: (ComponentClassificationCommand toStyleWith: aCssStyle)
		obtainingFileUsing: aDocumentProvider