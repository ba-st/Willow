Class {
	#name : #OpenLocationCommandTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-Frontend'
}

{ #category : #tests }
OpenLocationCommandTest >> testForNewBrowsingContextNavigatingTo [

	| html |

	html := self
		apply: (OpenLocationCommand forNewBrowsingContextNavigatingTo: 'http://www.google.com' seasideUrl)
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self
		assert: html
		equals: '<a target="_blank" rel="noopener noreferrer" href="http://www.google.com/"></a>'
]

{ #category : #tests }
OpenLocationCommandTest >> testForSameBrowsingContextNavigatingTo [

	| html |

	html := self
		apply:
			(OpenLocationCommand forSameBrowsingContextNavigatingTo: 'http://www.google.com' seasideUrl)
		toComponentDefinedBy: [ :canvas | canvas anchor ].

	self assert: html equals: '<a href="http://www.google.com/"></a>'
]
