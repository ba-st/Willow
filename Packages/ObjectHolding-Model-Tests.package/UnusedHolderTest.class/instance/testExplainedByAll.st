test
testExplainedByAll

	| holder |

	holder := UnusedHolder explainedByAll: (Array with: 'This is expected' with: 'This as well').

	self shouldnt: [ holder withContentDo: [ :model | self fail ] ] raise: Exception.
	self
		assert: (holder withContentDo: [ :model | self fail ] ifUnused: [ :explanations | explanations ])
		equals: (Array with: 'This is expected' with: 'This as well')