tests-rendering
testForRowNamedContaining

	| identifiedView html |

	identifiedView := IdentifiedWebView forRowNamed: 'main' containing: [ :canvas | canvas tableData: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<tr id="main-id1"><td>Hi</td></tr>'