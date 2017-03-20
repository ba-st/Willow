tests-Binary Choice-API
testCurrentSelection

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	self assert: binaryChoiceView currentSelection.

	binaryChoiceView toggleCurrentSelection.
	self deny: binaryChoiceView currentSelection.

	binaryChoiceView toggleCurrentSelection.
	self assert: binaryChoiceView currentSelection