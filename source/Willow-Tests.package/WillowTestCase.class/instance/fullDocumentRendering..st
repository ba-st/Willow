utility
fullDocumentRendering: aWillowApplication

	| builder html |

	builder := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | aWillowApplication updateRoot: root ];
		codec: self codec.
	html := WACurrentRequestContext
		use: self
		during: [ builder render: aWillowApplication ].
	^ html