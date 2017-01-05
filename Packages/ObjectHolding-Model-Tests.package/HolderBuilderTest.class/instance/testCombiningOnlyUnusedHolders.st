test
testCombiningOnlyUnusedHolders

	| firstHolder secondHolder builder |

	firstHolder := UnusedHolder explainedBy: 'This is expected'.
	secondHolder := UnusedHolder explainedBy: 'This is expected as well'.
	builder := HolderBuilder
		combining: (Array with: firstHolder with: secondHolder)
		using: [ :combinedContents :eachContent | combinedContents min: eachContent ].

	self
		assertCollection:
			(builder builtHolder withContentDo: [ :model | model ] ifUnused: [ :explanations | explanations ])
		hasSameElements: (Array with: 'This is expected' with: 'This is expected as well')