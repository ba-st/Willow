tests-rendering
testRenderContentOnWithElementsAndSomethingSelected

	| radioGroup html |

	radioGroup := RadioGroupWebView applyingToEachRadioButton: CompositeComponentCommand empty.
	radioGroup allowAnyOf: #('Buenos Aires' 'CABA').
	radioGroup chooseAnySatisfying: [ :place | true ] ifNone: [ self fail ].

	html := self render: radioGroup.

	self assert: html equals: '<input name="1" checked="checked" value="1" type="radio"/>Buenos Aires<input name="1" value="2" type="radio"/>CABA'.

	radioGroup chooseAnySatisfying: [ :place | place beginsWith: 'C' ] ifNone: [ self fail ].

	html := self render: radioGroup.

	self assert: html equals: '<input name="1" value="1" type="radio"/>Buenos Aires<input name="1" checked="checked" value="2" type="radio"/>CABA'