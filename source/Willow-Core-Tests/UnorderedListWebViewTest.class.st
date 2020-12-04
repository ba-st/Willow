"
An UnorderedListWebViewTest is a test class for testing the behavior of UnorderedListWebView
"
Class {
	#name : #UnorderedListWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'tests-rendering' }
UnorderedListWebViewTest >> testIdentifyIn [

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list |  ] listing: #('spoon' 'fork') applyingToEach: [ :listItem |  ].

	html := self
		renderUsing: [ :canvas | 
			unorderedList identifyIn: canvas.
			canvas render: unorderedList ].

	self
		assert: html equals: '<ul id="unordered-list-id1"><li>spoon</li><li>fork</li></ul>';
		assert: unorderedList identifier equals: 'unordered-list-id1'
]

{ #category : #'tests-rendering' }
UnorderedListWebViewTest >> testOnTrigger [

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list |  ] listing: #('spoon' 'fork') applyingToEach: [ :listItem |  ].
	unorderedList onTrigger disable.

	html := self render: unorderedList.

	self assert: html equals: '<ul id="ul-id1"><li>spoon</li><li>fork</li></ul><script type="text/javascript">$("#ul-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
UnorderedListWebViewTest >> testRenderContentOn [

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list |  ] listing: #('spoon' 'fork') applyingToEach: [ :listItem |  ].

	html := self render: unorderedList.

	self assert: html equals: '<ul><li>spoon</li><li>fork</li></ul>'
]

{ #category : #'tests-rendering' }
UnorderedListWebViewTest >> testRenderContentOnWithCommands [

	| unorderedList html |

	unorderedList := UnorderedListWebView applying: [ :list | list addClass willow ] listing: #('spoon' 'fork') applyingToEach: [ :listItem | listItem addClass loading ].

	html := self render: unorderedList.

	self assert: html equals: '<ul class="willow"><li class="willow-loading">spoon</li><li class="willow-loading">fork</li></ul>'
]
