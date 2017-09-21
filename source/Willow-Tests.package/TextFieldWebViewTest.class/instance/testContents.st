tests-container-API
testContents

	| field |

	field := TextFieldWebView singleLineTriggeringOnChangeApplying: [  ].

	self assert: field contents isEmpty.

	field changeContentsTo: 'Hello World!'.

	self assert: field contents equals: 'Hello World!'