tests-Binary Choice-API
testControlSelection

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	binaryChoiceView selectOffModel.
	self deny: binaryChoiceView currentSelection.

	binaryChoiceView selectOnModel.
	self assert: binaryChoiceView currentSelection.

	binaryChoiceView selectOffModel.
	self deny: binaryChoiceView currentSelection