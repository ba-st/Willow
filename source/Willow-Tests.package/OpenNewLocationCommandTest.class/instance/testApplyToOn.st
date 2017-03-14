tests
testApplyToOn

	| html |

	html := self apply: (OpenNewLocationCommand navigatingTo: 'http://www.google.com' seasideUrl) toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a target="_blank" href="http://www.google.com/"></a>'