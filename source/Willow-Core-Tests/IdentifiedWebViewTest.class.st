"
An IdentifiedWebViewTest is a test class for testing the behavior of IdentifiedWebView
"
Class {
	#name : #IdentifiedWebViewTest,
	#superclass : #BWRenderingTest,
	#category : #'Willow-Core-Tests-WebViews'
}

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testForFieldSetNamedContaining [

	| identifiedView html |

	identifiedView := IdentifiedWebView forLabeledFieldNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<fieldset class="willow" id="main-id1"><span>Hi</span></fieldset>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testForFormNamedContaining [

	| identifiedView html |

	identifiedView := IdentifiedWebView forFormNamed: 'main' containing: [ :canvas | canvas div: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals:  '<form accept-charset="utf-8" method="post" action="/" onsubmit="return false;" id="main-id1"><div>Hi</div></form>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testForPhrasingContainerNamedContaining [

	| identifiedView html |

	identifiedView := IdentifiedWebView forSpanNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<span id="main-id1"><span>Hi</span></span>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testForRowNamedContaining [

	| identifiedView html |

	identifiedView := IdentifiedWebView forRowNamed: 'main' containing: [ :canvas | canvas tableData: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<tr id="main-id1"><td>Hi</td></tr>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testOnTrigger [

	| identifiedView html |

	identifiedView := IdentifiedWebView
		forDivNamed: 'main'
		containing: ( PhrasingContainerWebView wrapping: 'Text' applying: [ :container |  ] ).
	identifiedView on trigger disable.
	html := self render: identifiedView.

	self
		assert: html
		equals:
			'<div id="main-id1"><span id="span-id2">Text</span></div><script type="text/javascript">$("#span-id2").click(function(event){$(this).prop("disabled",true)});</script>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testRenderContentOn [

	| identifiedView html |

	identifiedView := IdentifiedWebView forDivNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self
		assert: html equals: '<div id="main-id1"><span>Hi</span></div>';
		assert: identifiedView identifier equals: 'main-id1'.

	html := self render: identifiedView view.

	self assert: html equals: '<span>Hi</span>'
]

{ #category : #'tests-rendering' }
IdentifiedWebViewTest >> testRenderContentOnWithScriptingCommand [

	| identifiedView html |

	identifiedView := IdentifiedWebView
		forDivNamed: 'main'
		containing: ''
		applying: [ :div | div addScript js: [ :canvas | canvas jQuery this ] ].
	html := self render: identifiedView.
	self
		assert: html
			equals: '<div id="main-id1"></div><script type="text/javascript">$("#main-id1");</script>';
		assert: identifiedView identifier equals: 'main-id1'
]
