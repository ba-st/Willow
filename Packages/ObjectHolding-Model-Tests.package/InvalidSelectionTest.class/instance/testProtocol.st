test
testProtocol

	| invalidSelection |

	invalidSelection := InvalidSelection new.
	self
		should: [ invalidSelection name ] raise: SelectionIsInvalid;
		should: [ invalidSelection size ] raise: SelectionIsInvalid.

	self
		should:
			[ invalidSelection withContentDo: [ :model | self fail ] ifUnused: [ :explanations | self fail ] ]
		raise: SelectionIsInvalid