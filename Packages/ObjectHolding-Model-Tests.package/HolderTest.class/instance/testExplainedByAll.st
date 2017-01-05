test
testExplainedByAll

	| holder |

	holder := Holder containing: 'The model'.

	self
		assert: (holder withContentDo: [ :model | model ]) equals: 'The model';
		assert: (holder withContentDo: [ :model | model ] ifUnused: [ :explanations | self fail ]) equals: 'The model'