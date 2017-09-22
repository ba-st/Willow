tests-rendering
testRenderContentOn

	| fileDownloadAnchor html |

	fileDownloadAnchor := FileDownloadAnchorWebView
		labeled: 'Download me!'
		applying: [ :command |  ]
		obtainingFileUsing:
			[ WAMimeDocument on: '<note><to>Tove</to><from>Jani</from><heading>Reminder</heading><body>Don''t forget me this weekend!</body></note>' mimeType: (WAMimeType fromString: 'text/xml') fileName: 'note.xml' ].

	html := self render: fileDownloadAnchor.

	self assert: html equals: '<a href="/?1">Download me!</a>'