test
testCombiningOnlyUsedHolders

	| firstHolder secondHolder builder |

	firstHolder := Holder containing: 11.
	secondHolder := Holder containing: 30.

	builder := HolderBuilder combining: (Array with: firstHolder with: secondHolder) using: [ :combinedContents :eachContent | combinedContents min: eachContent ].

	self assert: (builder builtHolder withContentDo: [ :model | model ] ifUnused: [ :explanations | self fail ]) equals: 11