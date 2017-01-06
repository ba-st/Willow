test
testCombiningUsedAndUnusedHolders

	| firstHolder secondHolder builder |

	firstHolder := Holder containing: 34.
	secondHolder := UnusedHolder explainedBy: 'This is not expected'.
	builder := HolderBuilder
		combining: (Array with: firstHolder with: secondHolder)
		using: [ :combinedContents :eachContent | combinedContents min: eachContent ].

	self
		assert:
			(builder builtHolder withContentDo: [ :model | model ] ifUnused: [ :explanations | self fail ])
		equals: 34