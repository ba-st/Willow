"
A PhrasingContainerWebViewTest is a test class for testing the behavior of PhrasingContainerWebView
"
Class {
	#name : #PhrasingContainerWebViewTest,
	#superclass : #WARenderingTest,
	#category : 'Willow-Tests-WebViews'
}

{ #category : #'tests-rendering' }
PhrasingContainerWebViewTest >> testOnTrigger [

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :span | span addClass willow ].
	container onTrigger disable.
	html := self render: container.

	self assert: html equals: '<span id="span-id1" class="willow">Hi!</span><script type="text/javascript">$("#span-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
PhrasingContainerWebViewTest >> testRenderContentOn [

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ].
	html := self render: container.

	self assert: html equals: '<span>Hi!</span>'
]

{ #category : #'tests-rendering' }
PhrasingContainerWebViewTest >> testRenderContentOnWithCommands [

	| container html |

	container := PhrasingContainerWebView obtainingContentFrom: [ 'Hi!' ] applying: [ :span | span addClass willow ].
	html := self render: container.

	self assert: html equals: '<span class="willow">Hi!</span>'
]
