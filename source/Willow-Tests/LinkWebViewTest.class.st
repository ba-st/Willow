"
An AsynchronicLinkWebViewTest is a test class for testing the behavior of AsynchronicLinkWebView
"
Class {
	#name : #LinkWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Tests-WebViews'
}

{ #category : #'tests-rendering' }
LinkWebViewTest >> testAsynchronicLabeledApplying [

	| html link |

	link := LinkWebView
		asynchronicLabeled: 'Click me!'
		applying: [ :view | view addClass willow ].
	html := self render: link.

	self
		assert: html
		equals:
			'<a id="a-id1" class="willow">Click me!</a><script type="text/javascript">$("#a-id1").click(function(event){arguments[0].preventDefault()});</script>'
]

{ #category : #'tests-rendering' }
LinkWebViewTest >> testOnTrigger [

	| html link |

	link := LinkWebView synchronicLabeled: 'Click me!' applying: [  ].
	link onTrigger disable.
	html := self render: link.

	self
		assert: html
		equals:
			'<a id="a-id1">Click me!</a><script type="text/javascript">$("#a-id1").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
LinkWebViewTest >> testRenderContentOn [

	| html link |

	link := LinkWebView synchronicLabeled: 'Click me!' applying: [  ].
	html := self render: link.

	self assert: html equals: '<a>Click me!</a>'
]

{ #category : #'tests-rendering' }
LinkWebViewTest >> testSynchronicLabeledApplying [

	| html link |

	link := LinkWebView
		synchronicLabeled: 'Click me!'
		applying: [ :view | view addClass willow ].
	html := self render: link.

	self assert: html equals: '<a class="willow">Click me!</a>'
]
