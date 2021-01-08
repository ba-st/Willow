"
A GenericContainerWebViewTest is a test class for testing the behavior of GenericContainerWebView
"
Class {
	#name : #ContainerWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #tests }
ContainerWebViewTest >> testBeIdentifiable [

	| container html |

	container := ContainerWebView
		wrapping: 'Hello world'
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	container beIdentifiable.
	html := self render: container.

	self assert: html equals: '<div id="container-id1">Hello world</div>'
]

{ #category : #tests }
ContainerWebViewTest >> testIdentifierOn [

	| container |

	container := ContainerWebView
		wrapping: [ :canvas | canvas render: 'Hi!' ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	self
		renderUsing: [ :canvas | self assert: ( container identifierOn: canvas ) equals: 'container-id1' ]
]

{ #category : #tests }
ContainerWebViewTest >> testOn [

	| container html |

	container := ContainerWebView
		wrapping: 'Hello world'
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	container on trigger disable.
	html := self render: container.

	self
		assert: html
		equals:
			'<div id="container-id1">Hello world</div><script type="text/javascript">$("#container-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #tests }
ContainerWebViewTest >> testRenderContentOn [

	| container html |

	container := ContainerWebView
		wrapping: [ :canvas | canvas render: 'Hi!' ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].
	html := self render: container.

	self assert: html equals: '<div>Hi!</div>'
]

{ #category : #tests }
ContainerWebViewTest >> testRenderContentOnWithScriptingCommand [

	| container html |

	container := ContainerWebView
		wrapping: [ :canvas | canvas render: 'Hi!' ]
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [ :div | div addScript js: [ :canvas | canvas jQuery this ] ].
	html := self render: container.

	self
		assert: html
		equals: '<div id="id1">Hi!</div><script type="text/javascript">$("#id1");</script>'
]

{ #category : #tests }
ContainerWebViewTest >> testRenderableContent [

	| content container |

	content := [ :canvas | canvas render: 'Hi!' ].
	container := ContainerWebView
		wrapping: content
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [  ].

	self assert: container renderableContent equals: content
]

{ #category : #tests }
ContainerWebViewTest >> testWrappingIntoElementBuiltUsingApplying [

	| container html |

	container := ContainerWebView
		wrapping: 'Hello world'
		intoElementBuiltUsing: [ :canvas | canvas div ]
		applying: [ :theContainer | theContainer addClass willow ].
	html := self render: container.

	self assert: html equals: '<div class="willow">Hello world</div>'
]
