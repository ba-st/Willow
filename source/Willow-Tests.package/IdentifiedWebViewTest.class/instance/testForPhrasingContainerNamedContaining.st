tests-rendering
testForPhrasingContainerNamedContaining

	| identifiedView html |

	identifiedView := IdentifiedWebView forSpanNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<span id="main-id1"><span>Hi</span></span>'