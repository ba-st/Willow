tests-rendering
testRenderContentOn

	| identifiedView html |

	identifiedView := IdentifiedWebView forDivNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<div id="main-id1"><span>Hi</span></div>'