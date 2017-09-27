tests-container-API
testContents

	| textField |

	textField := TextFieldWebView singleLineTriggeringOnChangeApplying: [ :field |  ].

	self assert: textField contents isEmpty.

	textField changeContentsTo: 'Hello World!'.

	self assert: textField contents equals: 'Hello World!'