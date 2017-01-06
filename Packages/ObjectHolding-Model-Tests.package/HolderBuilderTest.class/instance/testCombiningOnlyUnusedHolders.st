test
testCombiningOnlyUnusedHolders

	| firstHolder secondHolder builder |

	firstHolder := UnusedHolder explainedBy: 'This is expected'.
	secondHolder := UnusedHolder explainedBy: 'This is expected as well'.

	builder := HolderBuilder combining: (Array with: firstHolder with: secondHolder) using: [ :combinedContents :eachContent | combinedContents min: eachContent ].

	#('This is expected' 'This is expected as well')
		with: (builder builtHolder withContentDo: [ :model | self fail ] ifUnused: [ :explanations | explanations ])
		do: [ :expected :built | self assert: expected equals: built ]