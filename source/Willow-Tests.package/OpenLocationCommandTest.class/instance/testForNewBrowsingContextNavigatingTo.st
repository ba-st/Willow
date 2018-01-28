tests
testForNewBrowsingContextNavigatingTo

	| html |

	html := self
		apply: (OpenLocationCommand forNewBrowsingContextNavigatingTo: 'http://www.google.com' seasideUrl)
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self
		assert: html
		equals: '<a target="_blank" rel="noopener noreferrer" href="http://www.google.com/"></a>'