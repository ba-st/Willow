"
This test case verifies method extensions to Seaside classes
"
Class {
	#name : #WillowSeasideExtensionsTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Applications'
}

{ #category : #accessing }
WillowSeasideExtensionsTest >> componentSupplier [

	"To support calls for the context componentSupplier"

	^ self
]

{ #category : #accessing }
WillowSeasideExtensionsTest >> createHandlers [

	^ Array with: self
]

{ #category : #accessing }
WillowSeasideExtensionsTest >> isSession [

	^ true
]

{ #category : #tests }
WillowSeasideExtensionsTest >> testComponentSupplier [

	self
		renderUsing: [ :canvas | 
			| webView |

			webView := PhrasingContainerWebView wrapping: 'The Content' applying: [ :container |  ].
			self assert: webView componentSupplier equals: self ]
]

{ #category : #tests }
WillowSeasideExtensionsTest >> testGRSmallOrderedSetAt [

	| orderedSet |

	orderedSet := GRSmallOrderedSet new.
	orderedSet
		add: 'a';
		add: 'a';
		add: 'c';
		add: 'b';
		add: 'c';
		add: 'a'.
	self
		assert: (orderedSet at: 1) equals: 'a';
		assert: (orderedSet at: 2) equals: 'c';
		assert: (orderedSet at: 3) equals: 'b'
]

{ #category : #tests }
WillowSeasideExtensionsTest >> testIcon [

	| html |

	html := self render: [ :canvas | canvas icon ].

	self assert: html equals: '<i></i>'
]

{ #category : #tests }
WillowSeasideExtensionsTest >> testJSObjectWillow [

	self assert: JSStream this willow asJavascript equals: 'Willow'
]

{ #category : #tests }
WillowSeasideExtensionsTest >> testWAUrlSlash [

	| url |

	url := 'http://www.example.com' seasideUrl.
	self assert: url / 'api' equals: 'http://www.example.com/api' seasideUrl
]
