tests
testCantCreateWithoutRenderingCommands

	self
		should: [ WebTableMultiColumnRenderer titled: 'Title' renderingItemWithAll: #() ]
		raise: AssertionFailed
		withExceptionDo: [ :error | 
			self
				assert: error messageText
				equals: 'Don''t use this renderer with less than two column rendering commands. Use WebTableColumnRenderer instead.' ]