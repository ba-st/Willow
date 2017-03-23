tests-Binary Choice-API
testAllows

	| binaryChoiceView |

	binaryChoiceView := self newBinaryChoiceView.

	self
		assert: (binaryChoiceView allows: true);
		assert: (binaryChoiceView allows: false);
		deny: (binaryChoiceView allows: 1)