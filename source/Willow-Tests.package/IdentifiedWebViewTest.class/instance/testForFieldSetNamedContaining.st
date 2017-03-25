tests-rendering
testForFieldSetNamedContaining

	| identifiedView html |

	identifiedView := IdentifiedWebView forLabeledFieldNamed: 'main' containing: [ :canvas | canvas span: 'Hi' ].
	html := self render: identifiedView.
	self assert: html equals: '<fieldset class="willow" id="main-id1"><span>Hi</span></fieldset>'