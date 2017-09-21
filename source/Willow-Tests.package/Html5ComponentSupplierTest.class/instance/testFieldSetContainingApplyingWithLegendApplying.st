tests-Supplying
testFieldSetContainingApplyingWithLegendApplying

	| supplier fieldSet html |

	supplier := Html5ComponentSupplier new.

	fieldSet := supplier
		fieldSetContaining: 'The View'
		applying: [ :command | command disable ]
		withLegend: 'Its Title'
		applying: [ :command | command autofocus ].
	html := self render: fieldSet.

	self assert: html equals: '<fieldset disabled="disabled"><legend autofocus="autofocus">Its Title</legend>The View</fieldset>'