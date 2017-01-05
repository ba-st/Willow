test
testExplainedByAll

	| holder |

	holder := UnusedHolder explainedByAll: #('This is expected' 'This as well').

	self
		shouldnt: [ holder withContentDo: [ :model | self fail ] ] raise: Exception;
		assert: (holder withContentDo: [ :model | self fail ] ifUnused: [ :explanations | explanations ]) equals: #('This is expected' 'This as well')