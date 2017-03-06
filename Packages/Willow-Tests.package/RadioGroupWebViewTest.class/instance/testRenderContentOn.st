tests-rendering
testRenderContentOn

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: CompositeComponentCommand empty.
	html := self render: radioGroup.

	self assert: html isEmpty