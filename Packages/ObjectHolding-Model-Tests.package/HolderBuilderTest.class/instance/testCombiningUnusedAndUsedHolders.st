test
testCombiningUnusedAndUsedHolders

	| firstHolder secondHolder builder |

	firstHolder := UnusedHolder explainedBy: 'This is not expected'.
	secondHolder := Holder containing: 34.
	builder := HolderBuilder
		combining: (Array with: firstHolder with: secondHolder)
		using: [ :combinedContents :eachContent | combinedContents min: eachContent ].

	self
		assert:
			(builder builtHolder withContentDo: [ :model | model ] ifUnused: [ :explanations | explanations ])
		equals: 34