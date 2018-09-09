"
A GenericContainerWebViewTest is a test class for testing the behavior of GenericContainerWebView
"
Class {
	#name : #GenericContainerWebViewTest,
	#superclass : #WARenderingTest,
	#category : #'Willow-Tests-WebViews'
}

{ #category : #tests }
GenericContainerWebViewTest >> testOnTrigger [

	| container html |

	container := GenericContainerWebView obtainingContentFrom: [ 'Hi!' ].
	container onTrigger disable.
	html := self render: container.

	self assert: html equals: '<div id="div-id1">Hi!</div><script type="text/javascript">$("#div-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #tests }
GenericContainerWebViewTest >> testRenderContentOn [

	| container html |

	container := GenericContainerWebView obtainingContentFrom: ['Hi!'].
	html := self render: container.

	self assert: html equals: '<div>Hi!</div>'
]

{ #category : #tests }
GenericContainerWebViewTest >> testRenderContentOnWithCommands [

	| container html |

	container := GenericContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :theContainer | theContainer addClass willow ].
	html := self render: container.

	self assert: html equals: '<div class="willow">Hi!</div>'
]

{ #category : #tests }
GenericContainerWebViewTest >> testWrappingApplying [

	| container html |

	container := GenericContainerWebView wrapping: 'Hello world' applying: [ :theContainer |  ].
	html := self render: container.

	self assert: html equals: '<div>Hello world</div>'
]
