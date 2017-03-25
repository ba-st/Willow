tests-rendering
testRenderContentOn

	| identifiedView html |

	identifiedView := IdentifiedWebView forDivNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self
		assert: html equals: '<div id="main-id1"><span>Hi</span></div>';
		assert: identifiedView identifier equals: 'main-id1'.

	html := self render: identifiedView view.

	self assert: html equals: '<span>Hi</span>'