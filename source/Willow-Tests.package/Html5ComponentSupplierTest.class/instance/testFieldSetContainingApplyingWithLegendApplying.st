tests-Supplying
testFieldSetContainingApplyingWithLegendApplying

	self
		assertRenderingOf: [ :supplier | 
			supplier
				fieldSetContaining: 'The View'
				applying: [ :fieldSet | fieldSet beDisabled ]
				withLegend: 'Its Title'
				applying: [ :legend | legend beAutofocused ] ]
		equals: '<fieldset disabled="disabled"><legend autofocus="autofocus">Its Title</legend>The View</fieldset>'