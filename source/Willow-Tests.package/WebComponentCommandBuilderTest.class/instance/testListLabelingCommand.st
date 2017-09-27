tests
testListLabelingCommand

	| html |

	html := self
		apply: (self commandBuilder labelItemsWith: [ :string | string asUppercase ])
		toComponentDefinedBy: [ :canvas | canvas select list: #('one' 'two') ].

	self assert: html equals: '<select><option>ONE</option><option>TWO</option></select>'