tests
testForSameBrowsingContextNavigatingTo

	| html |

	html := self
		apply:
			(OpenLocationCommand forSameBrowsingContextNavigatingTo: 'http://www.google.com' seasideUrl)
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a href="http://www.google.com/"></a>'