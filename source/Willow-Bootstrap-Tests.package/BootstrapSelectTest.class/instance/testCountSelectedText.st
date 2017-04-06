tests-Options
testCountSelectedText

	| html |

	html := self renderMultiSelectApplying: [ :bootstrapSelect | bootstrapSelect countSelectedText: 'Selected {0} of {1}' ].

	self
		assert: html
		equals:
			'<select id="id1" multiple="multiple"><option>1</option><option>2</option><option>3</option></select><script type="text/javascript">$("#id1").selectpicker({"countSelectedText":"Selected {0} of {1}"});</script>'