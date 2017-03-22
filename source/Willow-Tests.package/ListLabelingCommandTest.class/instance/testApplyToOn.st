tests-processing
testApplyToOn

	| html |

	html := self
		apply: (ListLabelingCommand with: [ :string | string asUppercase ])
		toComponentDefinedBy: [ :canvas | canvas select list: #('one' 'two') ].

	self assert: html equals: '<select><option>ONE</option><option>TWO</option></select>'