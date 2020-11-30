Class {
	#name : #HeadingWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebViews'
}

{ #category : #tests }
HeadingWebViewTest >> testRenderContentOn [

	| container html |

	container := HeadingWebView displaying: 'Header' withLevel: 2.
	html := self render: container.

	self assert: html equals: '<h2>Header</h2>'
]

{ #category : #tests }
HeadingWebViewTest >> testRenderContentOnWithCommands [

	| container html |

	container := HeadingWebView displaying: 'Header' withLevel: 2 applying: [ :heading | heading addClass willow ].
	html := self render: container.

	self assert: html equals: '<h2 class="willow">Header</h2>'
]
