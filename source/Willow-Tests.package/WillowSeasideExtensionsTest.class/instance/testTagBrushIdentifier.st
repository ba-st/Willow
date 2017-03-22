tests
testTagBrushIdentifier

	self
		render: [ :canvas | 
			| div |

			div := canvas div.
			self should: [ div identifier ] raise: AssertionFailed.
			canvas ensureIdFor: div.
			self shouldnt: [ div identifier ] raise: AssertionFailed ]