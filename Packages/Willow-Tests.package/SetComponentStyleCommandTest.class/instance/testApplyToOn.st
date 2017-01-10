tests-initialization
testApplyToOn
	| html |
	html := self
		apply:
			(SetComponentStyleCommand
				setting:
					(CssDeclarationBlock new
						background: 'blue';
						yourself))
		toComponentDefinedBy: [ :canvas | canvas div ].
	self
		assert: html
		equals: '<div style="background: blue;"></div>'