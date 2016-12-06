test
testExplainedBy

	| holder |

	holder := UnusedHolder explainedBy: 'This is expected'.

	self shouldnt: [ holder withContentDo: [ :model | self fail ] ] raise: Exception.
	self
		assert: (holder withContentDo: [ :model | self fail ] ifUnused: [ :explanations | explanations ])
		equals: (Array with: 'This is expected')